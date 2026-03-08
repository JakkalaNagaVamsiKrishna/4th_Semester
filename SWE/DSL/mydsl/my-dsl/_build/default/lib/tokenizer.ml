let is_digit = function
  | '0'..'9' -> true
  | _ -> false

let is_not_alphanum = function
  | 'a'..'z' | 'A'..'Z' | '0'..'9' -> false
  | _ -> true

let has_special_symbols s =
  String.exists is_not_alphanum s

type token_kind = 
  | LEFT_CURL 
  | RIGHT_CURL 
  | LEFT_PAR
  | RIGHT_PAR
  | END 
  | KHEL
  | AAOO
  | VAR 
  | ON_KEY
  | LOOP 
  | SET 
  | IF 
  | TATA 
  | TOKKOR 
  | DOT 
  | PLUS 
  | STAR 
  | MINUS 
  | LESS 
  | MORE 
  | IDF 
  | STR 
  | INT 

type token = { kind : token_kind; text : string; lit_val : string }
let rec tokenize source_game_chars =
match source_game_chars with
  | [] -> [ { kind = END; text = ""; lit_val = "null" } ]
  | "{" :: tail ->
  { kind = LEFT_CURL; text = "{"; lit_val = "null" } :: tokenize tail
  | "}" :: tail ->
  { kind = RIGHT_CURL; text = "}"; lit_val = "null" } :: tokenize tail
  | "(" :: tail -> 
  { kind = LEFT_PAR; text = "(" ; lit_val = "null" } :: tokenize tail 
  | ")" :: tail -> 
  { kind = RIGHT_PAR; text = ")" ; lit_val = "null"} :: tokenize tail 
  | "khel" :: tail -> 
  { kind = KHEL; text= "khel"; lit_val = "null"} :: tokenize tail 
  | "aaoo" :: tail -> 
  { kind = AAOO; text= "aaoo"; lit_val = "null"} :: tokenize tail
  | "var" :: tail -> 
  { kind = VAR; text= "var"; lit_val = "null"} :: tokenize tail
  | "on_key" :: tail -> 
  { kind = ON_KEY; text= "on_key"; lit_val = "null"} :: tokenize tail 
  | "loop" :: tail -> 
  { kind = LOOP; text= "loop"; lit_val = "null"} :: tokenize tail 
  | "set" :: tail -> 
  { kind = SET; text= "set"; lit_val = "null"} :: tokenize tail 
  | "if" :: tail -> 
  { kind = IF; text= "if"; lit_val = "null"} :: tokenize tail 
  | "tata" :: tail -> 
  { kind = TATA; text= "tata"; lit_val = "null"} :: tokenize tail 
  | "tokkor" :: tail -> 
  { kind = TOKKOR; text= "tokkor"; lit_val = "null"} :: tokenize tail 
  | "." :: tail -> 
  { kind = DOT; text= "."; lit_val = "null"} :: tokenize tail 
  | "+" :: tail -> 
  { kind = PLUS; text= "+"; lit_val = "null"} :: tokenize tail 
  | "*" :: tail -> 
  { kind = STAR; text= "*"; lit_val = "null"} :: tokenize tail
  | "-" :: tail -> 
  { kind = MINUS; text= "-"; lit_val = "null"} :: tokenize tail 
  | "<" :: tail -> 
  { kind = LESS; text= "<"; lit_val = "null"} :: tokenize tail 
  | ">" :: tail -> 
  { kind = MORE; text= ">"; lit_val = "null"} :: tokenize tail 
  | x :: tail -> (if (String.for_all is_digit x) then ({kind = INT; text = x; lit_val = x} :: tokenize tail) 
                  else (
                    if(x.[0] == '"') then ({kind = STR; text =  x ; lit_val = x } :: tokenize tail)
                    else ( if(has_special_symbols x) then (failwith "Error") else ({kind = IDF; text = x; lit_val = "null"} :: tokenize tail))
                  )) 


let rec print_tokens tok_list =
match tok_list with
  | [] -> ""
  | tok :: rest_toks -> (
  match tok with
  | { kind = LEFT_CURL; text; lit_val } ->
  "LEFT_CURL " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = RIGHT_CURL; text; lit_val } ->
  "RIGHT_CURL " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = END; text; lit_val } -> 
  "END " ^ text ^ lit_val ^ print_tokens rest_toks
  | { kind = LEFT_PAR; text; lit_val } -> 
  "LEFT_PAR " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = RIGHT_PAR; text; lit_val } -> 
  "RIGHT_PAR " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = KHEL; text; lit_val } -> 
  "KHEL " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = AAOO; text; lit_val } -> 
  "AAOO " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = VAR; text; lit_val } -> 
  "VAR " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = ON_KEY; text; lit_val } -> 
  "ON_KEY " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = LOOP; text; lit_val } -> 
  "LOOP " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = SET; text; lit_val } -> 
  "SET " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = IF; text; lit_val } -> 
  "IF " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = TATA; text; lit_val } -> 
  "TATA " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = TOKKOR; text; lit_val } -> 
  "TOKKOR " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = DOT; text; lit_val } -> 
  "DOT " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = PLUS; text; lit_val } -> 
  "PLUS " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = STAR; text; lit_val } -> 
  "STAR " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = MINUS; text; lit_val } -> 
  "MINUS " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = LESS; text; lit_val } -> 
  "LESS " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = MORE; text; lit_val } -> 
  "MORE " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = IDF; text; lit_val } -> 
  "IDF " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = INT; text; lit_val } -> 
  "INT " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  | { kind = STR; text; lit_val } -> 
  "STR " ^ text ^ " " ^ lit_val ^ "\n"^ print_tokens rest_toks
  )