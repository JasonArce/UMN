## Assessment for Exercise Set 3

Run on September 30, 22:05:19 PM.

+ Pass: Change into directory "ex3".

### Part 1: Records and Unions

+  _1_ / _1_ : Pass: Check that expression `Spades` following file cards.ml has type `card_suit`

+  _1_ / _1_ : Pass: Check that expression `Jack` following file cards.ml has type `card_value`

+  _1_ / _1_ : Pass: Check that expression `{ value = Four; suit = Clubs }` following file cards.ml has type `card`

+  _1_ / _1_ : Pass: Check that expression `{ value = Queen; suit = Diamonds }` following file cards.ml has type `card`

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   card_of_string "10D"
   ```
   matches the pattern `{ value = Ten; suit = Diamonds }`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   string_of_card (card_of_string "9H")
   ```
   matches the pattern `"9H"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   trick_winner [ {value = Two; suit = Hearts}; {value = King; suit = Spades } ]
   ```
   matches the pattern `{ value = Two; suit = Hearts }`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   trick_winner [ { value = Two; suit = Hearts}; {value = King; suit = Hearts } ]
   ```
   matches the pattern `{ value = King; suit = Hearts }`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   try (Some (trick_winner [ ])) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




#### Subtotal: _9_ / _9_

### Part 2: Disjoint Unions

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tld (IP (8,8,8,8))
   ```
   matches the pattern `None`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tld (DNSName "cnn.com")
   ```
   matches the pattern `Some "com"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tld (DNSName "comcast.net")
   ```
   matches the pattern `Some "net"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}] (Some Diamonds)
   ```
   matches the pattern `{value = Simple 9; suit = Hearts}`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}; {value = Simple 2; suit = Diamonds}] (Some Diamonds)
   ```
   matches the pattern `{value = Simple 2; suit = Diamonds}`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}; {value = Simple 2; suit = Diamonds}] None
   ```
   matches the pattern `{value = Simple 9; suit = Hearts}`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}; {value = Ace; suit = Hearts}] None
   ```
   matches the pattern `{value = Ace; suit = Hearts}`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : card = {value = Simple 9; suit = Hearts}
`


#### Subtotal: _6_ / _7_

### Part 3: Inductive Data Types

+  _0_ / _1_ : Fail: Check that expression `(List (Ordered,[]))` following file document.ml has type `entity`There was an error: File "(stdin)", line 113, characters 27-31:
Error: This variant expression is expected to have type entity
       The constructor List does not belong to type entity


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   check_rules { head = d1.head ; body = [(List (Ordered, [ListItem []]))] }
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24m[1;31mError[0m: This variant expression is expected to have type entity
       The constructor List does not belong to type entity

   ```



+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   check_rules d_err1
   ```
   matches the pattern `false`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   check_rules { head = d1.head; body = d1.body @ [(ListItem [(Text "ok")])]}
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24m[1;31mError[0m: This variant expression is expected to have type entity
       The constructor ListItem does not belong to type entity

   ```



+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   find_headings d1
   ```
   matches the pattern `[Heading [Text "CS 2041 Document"]]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value find_headings
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   find_headings d_err1
   ```
   matches the pattern `[]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value find_headings
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   extract_text d1
   ```
   matches the pattern `"CS 2041 Document A short document A little more stuff Click this to go back"`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value extract_text
`


+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_min Empty
   ```
   matches the pattern `None`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_min t3
   ```
   matches the pattern `Some 3`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_max Empty
   ```
   matches the pattern `None`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_max t5
   ```
   matches the pattern `Some 12`.

   




+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   is_bstree Empty
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value is_bstree
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   is_bstree (Node(0,Empty,Leaf 1))
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value is_bstree
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   is_bstree (Node(0,Leaf 1,Empty))
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value is_bstree
`


+  _0_ / _1_ : Fail: 
Check that the result of evaluating
   ```
   is_bstree t3
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24m[1;31mError[0m: Unbound value is_bstree
`


#### Subtotal: _5_ / _15_

