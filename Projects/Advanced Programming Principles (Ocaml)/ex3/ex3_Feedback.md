### Feedback for Exercise set 3

Run on September 25, 11:18:43 AM.

+ Pass: Change into directory "ex3".

+ Pass: Check that file "cards.ml" exists.

+ Pass: Check that expression `Spades` following file cards.ml has type `card_suit`

+ Pass: Check that expression `Jack` following file cards.ml has type `card_value`

+ Pass: Check that expression `{ value = Four; suit = Clubs }` following file cards.ml has type `card`

+ Pass: Check that expression `{ value = Queen; suit = Diamonds }` following file cards.ml has type `card`

+ Pass: 
Check that the result of evaluating
   ```
   card_of_string "10D"
   ```
   matches the pattern `{ value = Ten; suit = Diamonds }`.

   




+ Pass: 
Check that the result of evaluating
   ```
   string_of_card (card_of_string "9H")
   ```
   matches the pattern `"9H"`.

   




+ Pass: 
Check that the result of evaluating
   ```
   trick_winner [ {value = Two; suit = Hearts}; {value = King; suit = Spades } ]
   ```
   matches the pattern `{ value = Two; suit = Hearts }`.

   




+ Pass: 
Check that the result of evaluating
   ```
   trick_winner [ { value = Two; suit = Hearts}; {value = King; suit = Hearts } ]
   ```
   matches the pattern `{ value = King; suit = Hearts }`.

   




+ Pass: 
Check that the result of evaluating
   ```
   try (Some (trick_winner [ ])) with Invalid_argument _ -> None
   ```
   matches the pattern `None`.

   




+ Pass: Check that file "hostinfo.ml" exists.

+ Pass: Check that file "card_option.ml" exists.

+ Pass: 
Check that the result of evaluating
   ```
   tld (IP (8,8,8,8))
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   tld (DNSName "cnn.com")
   ```
   matches the pattern `Some "com"`.

   




+ Pass: 
Check that the result of evaluating
   ```
   tld (DNSName "comcast.net")
   ```
   matches the pattern `Some "net"`.

   




+ Pass: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}] (Some Diamonds)
   ```
   matches the pattern `{value = Simple 9; suit = Hearts}`.

   




+ Pass: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}; {value = Simple 2; suit = Diamonds}] (Some Diamonds)
   ```
   matches the pattern `{value = Simple 2; suit = Diamonds}`.

   




+ Pass: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}; {value = Simple 2; suit = Diamonds}] None
   ```
   matches the pattern `{value = Simple 9; suit = Hearts}`.

   




+ Fail: 
Check that the result of evaluating
   ```
   trick_winner_trump [{value = Simple 9; suit = Hearts}; {value = Ace; suit = Hearts}] None
   ```
   matches the pattern `{value = Ace; suit = Hearts}`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
- : card = {value = Simple 9; suit = Hearts}
`


+ Pass: Check that file "document.ml" exists.

+ Pass: Check that file "btree.ml" exists.

+ Fail: Check that expression `(List (Ordered,[]))` following file document.ml has type `entity`There was an error: File "(stdin)", line 113, characters 27-31:
Error: This variant expression is expected to have type entity
       The constructor List does not belong to type entity


+ Fail: 
Check that the result of evaluating
   ```
   check_rules { head = d1.head ; body = [(List (Ordered, [ListItem []]))] }
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24mError: This record expression is expected to have type document
       The constructor List does not belong to type entity

   ```



+ Pass: 
Check that the result of evaluating
   ```
   check_rules d_err1
   ```
   matches the pattern `false`.

   




+ Fail: 
Check that the result of evaluating
   ```
   check_rules { head = d1.head; body = d1.body @ [(ListItem [(Text "ok")])]}
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 
   ```
 ;;
[24mError: This record expression is expected to have type document
       The constructor ListItem does not belong to type entity

   ```



+ Fail: 
Check that the result of evaluating
   ```
   find_headings d1
   ```
   matches the pattern `[Heading [Text "CS 2041 Document"]]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value find_headings
`


+ Fail: 
Check that the result of evaluating
   ```
   find_headings d_err1
   ```
   matches the pattern `[]`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value find_headings
`


+ Fail: 
Check that the result of evaluating
   ```
   extract_text d1
   ```
   matches the pattern `"CS 2041 Document A short document A little more stuff Click this to go back"`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value extract_text
`


+ Pass: 
Check that the result of evaluating
   ```
   tree_min Empty
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   tree_min t3
   ```
   matches the pattern `Some 3`.

   




+ Pass: 
Check that the result of evaluating
   ```
   tree_max Empty
   ```
   matches the pattern `None`.

   




+ Pass: 
Check that the result of evaluating
   ```
   tree_max t5
   ```
   matches the pattern `Some 12`.

   




+ Fail: 
Check that the result of evaluating
   ```
   is_bstree Empty
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value is_bstree
`


+ Fail: 
Check that the result of evaluating
   ```
   is_bstree (Node(0,Empty,Leaf 1))
   ```
   matches the pattern `true`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value is_bstree
`


+ Fail: 
Check that the result of evaluating
   ```
   is_bstree (Node(0,Leaf 1,Empty))
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value is_bstree
`


+ Fail: 
Check that the result of evaluating
   ```
   is_bstree t3
   ```
   matches the pattern `false`.

   


   Your solution evaluated incorrectly and produced some part of the following:

 ` ;;
[24mError: Unbound value is_bstree
`


