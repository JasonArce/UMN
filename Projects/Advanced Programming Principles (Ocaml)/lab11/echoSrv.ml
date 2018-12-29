(* this line makes the lwt bind infix operator available in scope *)
open Lwt
#include "str.cma"

exception Quit
 
(* the code to handle connection ending goes here: *)

(* Here, before echo_handler, is where we'll add the input line handler: *)

let echo_handler (inp,outp) =
  let rec main_loop () =
    Lwt_io.read_line inp >>= fun l ->
    handle_input inp outp l >>= fun l ->
    Lwt_io.write_line outp l >>= main_loop in
  Lwt.async (fun () -> Lwt.catch main_loop (fun e -> Lwt.return ()))

let close_channels a b = Lwt_io.close a >>= fun () -> Lwt_io.close b >>= Lwt.fail Quit

let handle_input a b str = if Str.string_before str 2 = "/q" then close_channels a b else Lwt.return str

let s = Lwt_io.establish_server (Unix.ADDR_INET(Unix.inet_addr_any, 16384)) echo_handler
let _ = Lwt_main.run (fst (Lwt.wait ()))
