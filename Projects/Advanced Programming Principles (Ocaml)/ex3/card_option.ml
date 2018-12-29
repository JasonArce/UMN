type value =  Simple of int | Jack | Queen | King | Ace | Two | Three | Four | Five | Six | Seven | Eight | Nine| Ten ;;
type card_suit = Clubs | Diamonds | Spades | Hearts ;;

type card = { value : value; suit : card_suit } ;;

let trick_winner cards = match cards with
| [] -> invalid_arg "empty trick"
| lead::t -> let rec win_helper cs cw = match cs with
  | c::t -> if c.suit = lead.suit && c.value > cw.value then win_helper t c
            else win_helper t cw
  | [] -> cw
    in win_helper t lead ;;

let trick_winner2 cards (v:card_suit) = match cards with
| [] -> invalid_arg "empty trick"
| lead::t -> let rec win_helper cs cw = match cs with
  | c::t -> if ((c.suit = v && cw.suit = v) && c.value > cw.value) || (c.suit = v && cw.suit != v) then win_helper t c
                else win_helper t cw
  | [] -> cw
    in win_helper t lead ;;

let rec trick_winner_trump (cards : card list) (trump : card_suit option) = match cards with
| [] -> invalid_arg "empty trick"
| lead::t -> let find_trump cards trump = match trump with
  | None -> trick_winner cards
  | Some Hearts -> trick_winner2 cards Hearts
  | Some Diamonds -> trick_winner2 cards Diamonds
  | Some Spades -> trick_winner2 cards Spades
  | Some Clubs -> trick_winner2 cards Clubs
  in find_trump cards trump ;;
