let find_duck lst = if lst = "goose" then "grey duck"
                    else if lst = "duck" then "duck"
                  else lst^" duck";;

let fixduck = List.map find_duck;;

let find_em num = Printf.sprintf "%X" num;;

let hex_list = List.map find_em;;

let de_parenthesize = List.filter (fun s -> s != '(' && s != ')');;

let p_hack = List.filter (fun (s,x) -> s < 0.05)
