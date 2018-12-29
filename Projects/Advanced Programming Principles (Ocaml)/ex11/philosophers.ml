open Lwt

let slp () = Lwt_unix.sleep (Random.float 0.001)

let philosopher s lk1 lk2 =
  Lwt_mutex.lock lk1 >>=
  fun () -> (Lwt_io.printf "%s got left chopstick!\n" s) >>= slp >>=
  fun () -> Lwt_mutex.lock lk2 >>=
  fun () -> (Lwt_io.printf "%s got right chopstick, eating!\n" s) >>= slp >>=
  fun () -> (Lwt_io.printf "%s all done eating!\n" s) >>=
  fun () -> Lwt.return (Lwt_mutex.unlock lk1) >>=
  fun () -> Lwt.return (Lwt_mutex.unlock lk2)

let rec polite_phil s lk1 lk2 =
  Lwt_mutex.lock lk1 >>=
  fun () -> (Lwt_io.printf "%s got left chopstick! \n" s) >>= slp >>=
  fun () -> if (Lwt_mutex.is_locked lk2) then ((Lwt_io.printf "%s can wait (sigh)...\n" s) >>=
  fun () -> Lwt.return (Lwt_mutex.unlock lk1) >>= slp >>=
  fun () -> polite_phil s lk1 lk2)
  else (Lwt_mutex.lock lk2 >>=
  fun () -> (Lwt_io.printf "%s got right chopstick, eating! \n" s) >>= slp >>=
  fun () -> (Lwt_io.printf "%s all done eating! \n" s) >>=
  fun () -> Lwt.return (Lwt_mutex.unlock lk1) >>=
  fun () -> Lwt.return (Lwt_mutex.unlock lk2))
