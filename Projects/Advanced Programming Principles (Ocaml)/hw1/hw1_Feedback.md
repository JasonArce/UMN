### Feedback for HW 1

Run on September 22, 16:51:36 PM.

+ Pass: Change into directory "hw1".

+ Pass: Check that file "tables.ml" exists.

+ Pass: Check that file "slicendice.ml" exists.

+ Pass: Check that hw1 files compile without errors

+ Pass: 
Check that the result of evaluating
   ```
   table_of_stringlist "," ["a"]
   ```
   matches the pattern `[["a"]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   table_of_stringlist "," ["a,b"]
   ```
   matches the pattern `[["a"; "b"]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   table_of_stringlist "|" ["a|b|c"; "d"]
   ```
   matches the pattern `[["a";"b";"c"]; ["d"]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   make_assoc []
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   make_assoc [[]]
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   make_assoc [["a"]]
   ```
   matches the pattern `[(1,1,"a")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (make_assoc [["a";"b"];["c"]])
   ```
   matches the pattern `List.sort compare [(2,1,"c"); (1,2,"b"); (1,1,"a")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   remap_columns [3] [(1,3,"a")]
   ```
   matches the pattern `[(1,1,"a")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   remap_columns [1] [(1,2,"a")]
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (remap_columns [1;1] [(1,1,"a")])
   ```
   matches the pattern `List.sort compare [(1,1,"a"); (1,2,"a")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   remap_rows [3] [(3,1,"a")]
   ```
   matches the pattern `[(1,1,"a")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   remap_rows [2] [(1,2,"a")]
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   List.sort compare (transpose_table [(1,1,"a"); (1,2,"b"); (1,3,"c"); (2,1,"d"); (2,2,"e"); (2,3,"f")])
   ```
   matches the pattern `List.sort compare [(1,1,"a"); (2,1,"b"); (3,1,"c"); (1,2,"d"); (2,2,"e"); (3,2,"f")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   transpose_table [(1,4,"h")]
   ```
   matches the pattern `[(4,1,"h")]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   transpose_table []
   ```
   matches the pattern `[]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a")]
   ```
   matches the pattern `[["a"]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a"); (2,1,"b")]
   ```
   matches the pattern `[["a"]; ["b"]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a"); (1,2,"b")]
   ```
   matches the pattern `[["a"; "b"]]`.

   




+ Pass: 
Check that the result of evaluating
   ```
   table_of_assoc [(1,1,"a"); (1,3,"b"); (3,1,"c"); (3,3,"d")]
   ```
   matches the pattern `[["a"; "b"]; ["c"; "d"]]`.

   




