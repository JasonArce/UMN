let rev_array a = match a with
  | [||] -> ()
  | _ -> for i = 0 to (((Array.length a) / 2)-1) do
    let tmp = a.(Array.length a - i - 1) in
      let () = a.(Array.length a - i - 1) <- a.(i) in a.(i) <- tmp done

let zip_array u v = let total = Array.make (Array.length u) ((u.(0)),(v.(0))) in let () = (for i = 0 to ((Array.length total)-1) do
 (total.(i) <- (u.(i), v.(i))) done) in total
