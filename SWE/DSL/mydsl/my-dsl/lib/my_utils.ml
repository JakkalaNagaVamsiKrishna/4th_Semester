
let get_clean_lines filename =
  let content = In_channel.with_open_text filename In_channel.input_all in
  content 
  |> String.split_on_char '\n'
  |> List.filter (fun s -> s <> "")


let helper s = List.init (String.length s) (String.get s)

let is_valid_start = function 
  | 'a'..'z' | 'A'..'Z' | '_' -> true 
  | _ -> false  

let is_valid_var_char = function
  | 'a'..'z' | 'A'..'Z' | '0'..'9' | '_' -> true
  | _ -> false

let is_digit = function 
| '0'..'9' -> true 
| _ -> false 

let is_valid_special = function 
| '{' | '}' | '(' | ')' | '.' | '*' | '+' | '-' | '<' | '>' -> true 
| _ -> false 

let rec char_to_tk l =
    match l with 
    | [] -> [] 
    | (' ' | '\r' | '\t') :: tail -> char_to_tk tail
    | 'a' :: 'a' :: 'o' :: 'o' :: tail -> "aaoo" :: char_to_tk tail 
    | 'k' :: 'h' :: 'e' :: 'l' :: tail -> "khel" :: char_to_tk tail 
    | 'v' :: 'a' :: 'r' :: tail -> "var" :: char_to_tk tail 
    | 'o' :: 'n' :: '_' :: 'k' :: 'e' :: 'y' :: tail -> "on_key" :: char_to_tk tail 
    | 'l' :: 'o' :: 'o' :: 'p' :: tail -> "loop" :: char_to_tk tail 
    | 's' :: 'e' :: 't' :: tail -> "set" :: char_to_tk tail 
    | 'i' :: 'f' :: tail -> "if" :: char_to_tk tail 
    | 't' :: 'a' :: 't' :: 'a' :: tail -> "tata" :: char_to_tk tail 
    | 't' :: 'o' :: 'k' :: 'k' :: 'o' :: 'r' :: tail -> "tokkor" :: char_to_tk tail 
    | x :: tail when (is_valid_special x) -> (String.make 1 x) :: char_to_tk tail 
    | '"' :: tail -> (let rec string_capture l acc = 
                        match l with 
                        | [] -> [acc] 
                        | x :: tail2 -> if (x = '"') then (({|"|} ^ acc ^ {|"|}) :: char_to_tk tail2) else (let acc = acc ^ (String.make 1 x) in  string_capture tail2 acc ) 
                     in string_capture tail "") 
    | x :: tail when (is_digit x) -> (let rec int_capture l acc = 
                                                    match l with 
                                                    | [] -> [acc] 
                                                    | x :: tail2 -> (if is_digit x then ( let acc = acc ^ (String.make 1 x) in  int_capture tail2 acc) else acc :: char_to_tk l)
                                                in int_capture tail (String.make 1 x)
                                                    )
    | x :: tail when (is_valid_start x)-> (let rec var_capture l acc = 
                        match l with 
                        | [] -> [acc] 
                        | x :: tail2 -> (if (is_valid_var_char x) then (let acc = acc ^ (String.make 1 x) in var_capture tail2 acc ) else (acc :: char_to_tk l))
                    in var_capture tail (String.make 1 x)) 
    | x :: _ -> failwith ("Unexpected character: " ^ (String.make 1 x))



let rec explode line_list = 
    match line_list with 
    | [] -> []
    | line :: tail -> (let char_list = helper line in (char_to_tk char_list @ explode tail) )