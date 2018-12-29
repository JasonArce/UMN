type 'a dlink = { mutable v : 'a ; mutable next : 'a dl ; mutable prev : 'a dl}
 and 'a dl = End | Link of 'a dlink
 and 'a dlist = List of 'a dl ref * 'a dl ref

let empty () = List (ref End, ref End)

let rec list_of_dl lnk = match lnk with
| End -> []
| Link n -> n.v::(list_of_dl (n.next))

let next_in lnk =
  let rec tr_next_in lnk num = match (lnk,num) with
| (End,_) -> End
| (Link n,0) -> tr_next_in n.next 1
| (Link n, 1) -> n.next
in tr_next_in lnk 0

let rec list_of_dlist (List (f,b)) = list_of_dl !f

let rec dl_of_dlist (List (f,b)) = !f


let snoc dl it = match dl with
|List (a,b) -> (match (!a,!b) with
                 |(End,End) -> a := (Link {v=it;next=End;prev=End}) ; b := (Link {v=it;next=End;prev=End})
                 |(Link hd,Link tl) -> if hd = tl then (let shifting = Link {v=it;next=End;prev=(!a)} in hd.next <- shifting; b := shifting)
                                         else (let shifting = Link {v=it;next=End;prev=(!b)} in (tl.next <- shifting); b := shifting))

 let remove it dl = match dl with
 |List (a,b) -> (match (!a,!b) with
                  |(End,End) -> ()
                  |(Link hd, Link tl) -> if hd = tl then (if hd.v = it then (a := End; b:= End) else ())
                                                      else (let rec innerremove itt aa before = match (aa,before) with
                                                            |(End,_) -> ()
                                                            |(Link c,Link d) ->  if (d.v) = it then (a := d.next; d.prev <- End)
                                                                                else if (c.v) = it then d.next <- (next_in (before))
                                                                                                    else innerremove itt (c.next) aa
                                                                                                    in innerremove it !a !a))

let fold fn acc x = match x with
|List (a,b) -> let rec actual_fold fn acc a = match a with
                |End -> acc
                |Link hd -> actual_fold fn (fn acc hd.v) hd.next
                in actual_fold fn acc !a


let reduce fn x r = match x with
|List (a,b) -> let rec actual_reduce fn r b = match b with
                |End -> r
                |Link hd -> actual_reduce fn (fn hd.v r) hd.prev
                in actual_reduce fn r !b

let pop_front z = match z with
  |List (a,b) -> (match !a with
                   |End -> ()
                   |Link hd ->  remove hd.v z)

let pop_rear z = match z with
  |List (a,b) -> let move_it z b = match !b with
                  | End -> ()
                  |Link hd ->  b := hd.prev; hd.next <- End
                  in move_it z b
