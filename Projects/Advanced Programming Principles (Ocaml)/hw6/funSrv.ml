open Lwt
(* I did not use any outside modules. The "fun" part of the server is now a fortune cookie-esque function. When you do
  /f, you put in any number and a "random" fortune will be selected for the user, and also broadcasted to the other people
  in the chat as well as the person who typed /f # *)

(* a list associating user nicknames to the output channels that write to their connections *)
(* session is an empty list that will hold all the nicknames and their output channel as a tuple *)
let sessions = ref []
exception Quit

(* This global stream will be locked and unlocked in order to avoid multiple functions being modified at the same time *)
let aStream = Lwt_mutex.create ()


(* When broadcast is called, we iterate through the list of sessions to find the sender and avoid printing out the
message to them as well. If the sender isn't the name in the list, then the sender's name and their message is printed. *)
let rec broadcast sender msg = Lwt_list.iter_p (fun (x,y) -> if x = sender then Lwt.return () else Lwt_io.fprintl (List.assoc x !sessions) (sender^": "^msg)) (!sessions)

(* remove a session from the list of sessions: important so we don't try to
   write to a closed connection. The stream must be locked before the sessions can be edited. After a session is removed,
   <left chat> is broadcasted to the rest of the people in the chat room and the global stream is unlocked. *)
let rec remove_session nn =
                                  Lwt_mutex.lock aStream >>=
                                  fun () -> Lwt.return (sessions := List.remove_assoc nn !sessions) >>=
                                  fun () -> broadcast nn "<left chat>" >>=
                                  fun () -> Lwt.return (Lwt_mutex.unlock aStream)

(* add a session to the list of sessions. The stream must be locked before the sessions can be edited. After a session
is added, the global stream is unlocked. *)
let rec add_session nm out =      Lwt_mutex.lock aStream >>=
                                  fun () -> Lwt.return (sessions := (!sessions)@[(nm,out)]) >>=
                                  fun () -> Lwt.return (Lwt_mutex.unlock aStream)


(* handle_error catches Quit and then closes both of the person's channels and then removes their session. Any
other errors will be handled the same way. *)
let handle_error e nn inp outp = match e with
| Quit -> Lwt_io.close inp >>= fun () -> Lwt_io.close outp >>= fun () -> Lwt.return (remove_session nn)
| _ ->  Lwt_io.close inp >>= fun () -> Lwt_io.close outp >>= fun () -> Lwt.return (remove_session nn)

(* change_nn first broadcasts to the rest of the chat room that a new nickname is being chosen.
The global stream is then locked, the old nickname is removed from the session list, we bind the new nickname to the reference
of nn, then add the new nickname to the session list. The global stream is then unlocked. *)
let rec change_nn nn outp new_nn = broadcast !nn ("<changed nick to "^new_nn^">") >>=
                                 fun () -> Lwt_mutex.lock aStream >>=
                                 fun () -> Lwt.return (sessions := List.remove_assoc !nn !sessions) >>=
                                 fun () -> Lwt.return (nn := new_nn) >>=
                                 fun () -> Lwt.return (sessions := (!sessions)@[(new_nn,outp)]) >>=
                                 fun () -> Lwt.return (Lwt_mutex.unlock aStream)

 (*  login_handler first locks the global stream, then asks for the nickname of the person who just joined the chat.
 The input name is then added to the reference of nr. This nickname is added to the sessions list, broadcast is called
 to say that the nickname <joined> the chat, and then the global stream is unlocked. *)
let login_handler nr (inp,outp) = Lwt_mutex.lock aStream >>=
                                  fun () -> Lwt_io.fprintl outp "Enter initial nick:" >>=
                                  fun () -> Lwt_io.read_line inp >>=
                                  fun hold -> Lwt.return (nr := hold) >>=
                                  fun () -> Lwt.return (sessions := ((!nr,outp)::(!sessions))) >>=
                                  fun () -> broadcast !nr "<joined>" >>=
                                  fun () -> Lwt.return (Lwt_mutex.unlock aStream)

(* select_fortune takes in the number entered by the user modded by 5, and then selects the corresponding fortune. *)
let select_fortune a b = match a with
|0 -> b^"Serious trouble will bypass you."
|1 -> b^"If you have something good in your life, don't let it go!"
|2 -> b^"Meeting adversity well is the source of your strength."
|3 -> b^"The greatest risk is not taking one."
|4 -> b^"If winter comes, can spring be far behind?"
| _ -> b^"The future is hazy"

(* fortune_fun takes in the nickname and the and the number entered by the user and calls select_fortune but mods the number
by 5 so it can properly match. The fortune is broadcasted to the chatroom and is also printed for the individual to see. *)
let fortune_fun nr rn = broadcast !nr (!nr^", your fortune for the day is: "^(select_fortune (rn mod 5) "")) >>=
fun () -> Lwt_io.fprintl (List.assoc !nr !sessions) ("Your fortune for the day is: "^(select_fortune (rn mod 5) ""))

(* handle_input handles /q, /n, and /l.  First it check that something was actually entered, if it wasn't
this is caught and is matched as an "". This just does Lwt.return() and doesn't broadcast or print anything
to any users. /q will flush the output, then will essentially raise the Quit exception. This
is handled in handle_error. /n calls change_nn will the old name, output channel, and the new name. /l will iterate through
the session list and prints out all the names of the people in the chatroom. /f will take in the nickname and a number
and calls fortune_fun so the user gets a "random" fortune! Any other matches will just be broadcasted
as usual. *)
let handle_input nr outp l = let catch_empty = try if (String.length l = 1) then l else  (Str.string_before l 2) with _ -> "" in match (catch_empty) with
  | "/q" -> Lwt_io.flush outp >>= fun () -> Lwt.fail Quit
  | "/n" -> change_nn nr outp (Str.string_after l 3)
  | "/l" -> Lwt_list.iter_s (fun (x,y) -> Lwt_io.fprintl outp x) !sessions
  | "/f" -> fortune_fun nr (int_of_string (Str.string_after l 3))
  | "" -> Lwt.return ()
  | _ -> broadcast !nr l

(* chat_handler is what makes this program work. The only change I made was adding login_handler nick (inp,out) for
the let _ statement. This isn't part of the loop as you only login once. *)
let chat_handler (inp,outp) =
  let nick = ref "" in
  (* replace () below with call to login_handler *)
  let _ = login_handler nick (inp,outp) in
  let rec main_loop () =
	  Lwt_io.read_line inp >>= handle_input nick outp >>= main_loop in
  Lwt.async (fun () -> Lwt.catch main_loop (fun e -> handle_error e (!nick) inp outp))
