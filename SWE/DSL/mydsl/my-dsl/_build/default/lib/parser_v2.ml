open Tokenizer

(* Defining the Abstract Syntax tree*) 

type expr = 
    | Int of int 
    | Str of string 
    | Var of string 
    | Binary of expr * token_kind * expr  (* For PLUS, STAR, LESS etc. *)
    | Tokkor of string * string ;;

type stmt = 
    | VarDecl of expr * expr 
    | Set of expr * expr 
    | If of expr * stmt list * stmt list 
    | Loop of stmt list 
    | Khel of expr * expr * expr 
    | Aaoo of expr * expr * expr * expr
    | On_Key of expr * stmt list 
    | Tata ;;

let precedence = function 
  | STAR -> 3
  | PLUS | MINUS -> 2
  | LESS | MORE -> 1 
  | _ -> 0;;  


(* Helper to parse a single expression (Int, Str, Var, or Tokkor) *)
let parse_expr tokens =
  match tokens with
  | h :: t when h.kind = INT -> Int (int_of_string h.lit_val), t 
  | h :: t when h.kind = STR -> Str h.lit_val, t 
  | h :: t when h.kind = IDF -> Var h.text, t 
  | h :: t when h.kind = TOKKOR ->
      (match t with
       | s1 :: s2 :: tail -> Tokkor (s1.lit_val, s2.lit_val), tail 
       | _ -> failwith "Tokkor expects two strings")
  | _ -> failwith "Invalid Expression"

(* Main recursive parser: returns (parsed statements * remaining tokens) *)
let rec parser_help acc l =
  match l with
  | [] -> acc, [] 
  | h :: _ when h.kind = END -> acc, [] 
  | h :: t when h.kind = RIGHT_CURL -> acc, t 

  (* VAR: var <name> <val> *)
  | h :: t when h.kind = VAR ->
      let (name, t1) = parse_expr t in
      let (value, t2) = parse_expr t1 in
      parser_help (acc @ [VarDecl(name, value)]) t2 

  (* SET: set <var> <val> *)
  | h :: t when h.kind = SET ->
      let (v, t1) = parse_expr t in
      let (v_val, t2) = parse_expr t1 in
      parser_help (acc @ [Set(v, v_val)]) t2 

  (* KHEL: khel <n1> <n2> <str> *)
  | h :: t when h.kind = KHEL ->
      (   let val1, t1 = parse_expr t in 
          let val2, t2 = parse_expr t1 in 
          let str1, t3 = parse_expr t2 in 
           let khel_stmt = Khel(val1, val2, str1) in
           parser_help (acc @ [khel_stmt]) t3
       )

  (* AAOO: aaoo <var> <str> <n1> <n2> *)
  | h :: t when h.kind = AAOO ->(
            let val1, t1 = parse_expr t in 
            let val2, t2 = parse_expr t1 in 
            let val3, t3 = parse_expr t2 in 
            let val4, t4 = parse_expr t3 in 
              let aaoo_stmt = Aaoo(val1, val2, val3, val4) in 
              parser_help (acc @ [aaoo_stmt]) t4 
  )
      (* (match t with
       | s1 :: s2 :: n1 :: n2 :: tail -> 
           let stmt = Aaoo(Var(s1.text), Str(s2.lit_val), Int(int_of_string n1.lit_val), Int(int_of_string n2.lit_val)) in
           parser_help (acc @ [stmt]) tail 
       | _ -> failwith "Aaoo Error") *)

  (* LOOP: loop { <stmts> } *)
  | h :: t when h.kind = LOOP ->
      let t_after_left = match t with (p :: rest) when p.kind = LEFT_CURL -> rest | _ -> failwith "Loop expects {" in 
      let (body, t_after_body) = parser_help [] t_after_left in
      parser_help (acc @ [Loop(body)]) t_after_body 

  (* IF: if <cond> { <stmts> } *)
  | h :: t when h.kind = IF ->
      let (cond, t1) = parse_expr t in
      let t2 = match t1 with (p :: rest) when p.kind = LEFT_CURL -> rest | _ -> failwith "If expects {" in 
      let (then_branch, t3) = parser_help [] t2 in
      let t4 = match t3 with (p :: rest) when p.kind = LEFT_CURL -> rest | _ -> failwith "else expects {" in 
      let (else_branch, t5) = parser_help [] t4 in 
      (* For now, we assume empty else branch; you can expand this to check for an ELSE token *)
      parser_help (acc @ [If(cond, then_branch, else_branch)]) t5 

  (* ON_KEY: on_key <key> { <stmts> } *)
  | h :: t when h.kind = ON_KEY ->
      let (key, t1) = parse_expr t in
      let t2 = match t1 with (p :: rest) when p.kind = LEFT_CURL -> rest | _ -> failwith "On_Key expects {" in 
      let (body, t3) = parser_help [] t2 in
      parser_help (acc @ [On_Key(key, body)]) t3 

  (* TATA: Terminate program *)
  | h :: t when h.kind = TATA -> 
      parser_help (acc @ [Tata]) t 

  | _ -> failwith "Unknown Statement"

let parser token_list = 
    let (ast, _) = parser_help [] token_list in ast

