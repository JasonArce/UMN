## Assessment for Exercise Set 7

Run on October 23, 22:18:59 PM.

+ Pass: Change into directory "ex7".

### Part 1: Computing with program expressions

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   count_bindings (Const 3)
   ```
   matches the pattern `0`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   count_bindings (Let ("x", Const 4, Name "x"))
   ```
   matches the pattern `1`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   count_bindings (Let ("x", Const 4, Let ("y", Const 3, Add(Name "x", Name "y"))))
   ```
   matches the pattern `2`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   count_bindings (Let ("y", Const 3, Let ("y", BConst true, BConst false)))
   ```
   matches the pattern `2`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   count_bindings (Let ("y",Let("y", Const 3, Const 4), Const 5))
   ```
   matches the pattern `2`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   has_shadow_binding (Const 1)
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   has_shadow_binding (Let ("x", Const 1, Let ("y", Const 2, Name "x")))
   ```
   matches the pattern `false`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   has_shadow_binding (Let ("x", Const 1, Let ("x", Const 2, Const 3)))
   ```
   matches the pattern `true`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   has_shadow_binding (Let ("x", Let ("x", BConst true, Const 17), Name "x"))
   ```
   matches the pattern `false`.

   




#### Subtotal: _9_ / _9_

### Part 2: Exception types, type errors, and runtime exceptions

+  _1_ / _1_ : Pass: Item 1 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of raise

+  _1_ / _1_ : Pass: Item 2 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of strange

+  _1_ / _1_ : Pass: Item 3 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of Invalid_Argument

+  _1_ / _1_ : Pass: Item 4 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of invalid_arg

+  _1_ / _1_ : Pass: Item 5 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of String.sub

+  _1_ / _1_ : Pass: Item 6 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of list_mul

+  _1_ / _1_ : Pass: Item 7 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of guard_inv

+  _1_ / _1_ : Pass: Item 8 of list in exntypes.md passes Runtime vs Type Eror vs exn value test: Category of F

#### Subtotal: _8_ / _8_

### Part 3: Continuations

+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_k [1;2;3] [4;5;6] (fun l -> l)
   ```
   matches the pattern `[1;2;3;4;5;6]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_k [] ["emptylist"; "example"] (fun l->l)
   ```
   matches the pattern `["emptylist"; "example"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_k ['a'; 'b'] [] (fun l -> l)
   ```
   matches the pattern `['a'; 'b']`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_k ["deeply"] ["nested"] (fun l -> [[[l]]])
   ```
   matches the pattern `[[[["deeply"; "nested"]]]]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   append_k [1;2] [3;4;5] (fun l -> List.length l)
   ```
   matches the pattern `5`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   filter_k (fun s -> s < "m") ["zoo"; "in"; "san"; "diego"] (fun l -> l)
   ```
   matches the pattern `["in"; "diego"]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   filter_k (fun i -> i mod 2 = 0) [1;2;4;5;7] (fun l -> l)
   ```
   matches the pattern `[2;4]`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   filter_k (fun _ -> true) [1;2;3] (fun l -> List.length l)
   ```
   matches the pattern `3`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   filter_k (fun b -> b) [true; false; true; true] (fun _ -> "lolwut?")
   ```
   matches the pattern `"lolwut?"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_sum_k (Node(7, Node(3, Empty, Empty), Node(5, Node(1, Empty, Empty), Empty))) (fun s -> s)
   ```
   matches the pattern `16`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_sum_k (Node(7, Node(3, Empty, Empty), Node(5, Node(1, Empty, Empty), Empty))) (fun s -> string_of_int s)
   ```
   matches the pattern `"16"`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_sum_k Empty (fun s -> s)
   ```
   matches the pattern `0`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_map_k (string_of_int) (Node(7, Node(3, Empty, Empty), Node(5, Node(1, Empty, Empty), Empty))) (fun t -> t)
   ```
   matches the pattern `Node ("7", Node ("3", Empty, Empty), Node ("5", Node ("1", Empty, Empty), Empty))`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_map_k (fun x -> x/2) (Node(6, Empty, Empty)) (fun t->t)
   ```
   matches the pattern `Node (3, Empty, Empty)`.

   




+  _1_ / _1_ : Pass: 
Check that the result of evaluating
   ```
   tree_map_k (fun s -> s^"!") Empty (fun t -> "ignored")
   ```
   matches the pattern `"ignored"`.

   




#### Subtotal: _15_ / _15_

