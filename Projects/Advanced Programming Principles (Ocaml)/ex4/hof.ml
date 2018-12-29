
let drop_until input1 input2 =
  let rec tail_drop_until acc a b = match b with
  | [] -> List.rev acc
  | h::t -> if (a h) then (tail_drop_until (h::acc) a t) else acc
  in tail_drop_until [] input1 (List.rev input2)

let take_while input1 input2 =
  let rec tail_take_while acc a b = match b with
  | [] -> List.rev acc
  | h::t -> if (a h) then (tail_take_while (h::acc) a t) else acc
  in tail_take_while [] input1 input2

let take_until input1 input2 = 
  let rec tail_take_until acc a b = match b with
  | [] -> List.rev acc
  | h::t -> if (a h) then acc else (tail_take_until (h::acc) a t)
  in tail_take_until [] input1 input2
