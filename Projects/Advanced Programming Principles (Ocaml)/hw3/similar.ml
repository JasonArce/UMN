open SimUtil

(* Your code goes here: *)

(* Define the function that filters out non-alphabetic characters *)
(* filter_chars maps a function that changes the char to a lowercase value, and checks if the char's ascii value is between 97 and 122 inclusive.
This is because 97 is the representation for lowercase a and 122 is the representation for lowercase z. *)
let filter_chars s = String.map (fun a -> if( Char.code(Char.lowercase a) >= 97 && Char.code(Char.lowercase a) <= 122)
                      then a else ' ') s

(* Define the function that converts a string into a list of words *)
(* words filters each string in the list and essentially filters out any blank space and adds the non blank space to a list. *)
let words s = List.filter (fun x -> not (String.contains x ' ')) (split_words (filter_chars s))

(* Define the function that converts a list of strings into a list of word lists*)
(* wordlists adds these strings to a list. This is used in main when multiple files are put into lists. *)
let wordlists ls = List.map (fun s -> words s) ls

(* Use Stemmer.stem to convert a list of words into a list of stems *)
(* stemlist just maps a function that calls stemmer.stem to each string in ws. *)
let stemlist ws = List.map (fun s -> Stemmer.stem s ) ws

(* Define a function to convert a list into a set *)
(* to_set uses List.fold_left in order to compare each item in the list with the accumulator. If the accumulator already has that value
then it is not added to the accumulator, otherwise it is. This returns a backwards list, so I used List.rev to reverse the backwards list. *)
let to_set lst = List.rev (List.fold_left (fun acc h -> if List.mem h acc then acc else h::acc) [] lst )

(* Define the similarity function between two sets: size of intersection / size of union *)
(* intersection has an acculuator that acts as a counter and uses List.fold_left to run through the list. *)
let intersection_size s1 s2 = List.fold_left (fun acc h -> if List.mem h s1 then acc+1 else acc) 0 s2
(* union_size essentially uses List.gold_left and makes a to_set for the combined list s1 and s2. Inside of the function we check if the new accumulator list
already holds the value in the combined list otherwise it adds it to the accumulator. At the end, the length of the accumulator is called. *)
let union_size s1 s2 = List.length (List.fold_left (fun acc h -> if (List.mem h acc) && (List.mem h s1 || List.mem h s2) then acc else h::acc) [] (to_set s1@s2))
(* similarity applies the formula of intersection_size/union_size to get the float similarity between the two lists. *)
let similarity s1 s2 = (float_of_int (intersection_size s1 s2)) /. (float_of_int (union_size s1 s2))

(* Find the most similar representative file *)
(* find_max simply uses List.fold_left which calls max in its function, uses an essentially empty tuple for the accumulator's intitalizer, and 
then uses a combined tuple list of repsims & repnames to compare the accumulator to. *)
let find_max repsims repnames = List.fold_left (fun acc s -> max acc s)  (0.," ") (List.combine repsims repnames)

let main all replist_name target_name =
  (* Read the list of representative text files *)
  (* repfile_list uses the function file_lines in simUtil and replist_name is applied to that to read the list of text files. *)
  let repfile_list = file_lines replist_name in
  (* Get the contents of the repfiles and the target file as strings *)
  (* For rep_contents, file_as_string is mapped to each item in repfile_list. For target_contents, no mapping is needed, and file_as_string target_name
  can be used as an argument *)
  let rep_contents = List.map (file_as_string) (repfile_list) in
  let target_contents = file_as_string target_name in
  (* Compute the list of words from each representative *)
  (* rep_words just applies the above wordlists function to rep_contents as we are making multiple lists of words and adding them to a larger list. *)
  let rep_words = wordlists rep_contents in
  (* Convert the target text file into a list of words *)
  (* target_words is just one file, so the function words can be applied to it as only one list is needed. *)
  let target_words = words target_contents in
  (* Compute the lists of stems in all rep files and the target file *)
  (* rep_stemlists maps stemlist to each list in the list and applies it to the above function rep_words. As target_stemlist is just
  one list, no mapping is needed. *)
  let rep_stemlists = List.map (stemlist) rep_words in
  let target_stemlist = stemlist target_words in
  (* Convert all of the stem lists into stem sets *)
  (* rep_stemsets maps to_sets to a list of lists and makes converts them into to_set format using the inputs for replist_name.
  target_stemset does not need to be mapped as it only is applied to one list. *)
  let rep_stemsets = List.map (to_set) (rep_stemlists) in
  let target_stemset = to_set target_stemlist in
  (* Compute the similarities of each rep set with the target set *)
  (* repsims is mapped to a function of a list of lists (rep_stemsets) and applies the similarity function to them one at a time
  and to target_stemset for each item in rep_stemsets. This returns a single list instead of the list of lists that was rep_stemsets. 
  (sim,best_rep) just applies the find_max method and finds the file that closest matches the file that is currently being applied to find_max. *)
  let repsims = List.map (fun s -> similarity s target_stemset) rep_stemsets in
  let (sim,best_rep) = find_max repsims repfile_list in
  let () = if all then
  (* print out similarities to all representative files *)
  (* The formatting below identically mirrors the example given in the homework write up. List.iter2 helps print multiple files and their
  resulting "score". *)
  let () = print_endline "File\tSimilarity" in List.iter2 (fun x y -> print_endline ((y)^"\t"^(string_of_float x))) (repsims) (repfile_list)
  else begin
  (* Print out the winner and similarity *)
  (* The formatting below identically mirrors the example given in the homework write up. target_name gets the input file and 
  best_rep gets the most similar file to the input file. The similarity float is then printed in the next line. *)
  let () = print_endline ("The most similar file to "^target_name^" was "^best_rep) in
  print_endline ("Similarity"^"\t"^(string_of_float sim))  end in
  (* this last line just makes sure the output prints before the program exits *)
  flush stdout
