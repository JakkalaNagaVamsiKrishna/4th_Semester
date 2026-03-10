(* open Tokenizer

let write_file filename content = 
    let oc = open_out filename in 
    try 
        output_string oc content;
        close_out oc 
    with e -> 
    close_out_noerr oc;
    raise e ;;


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
    | On_Key of expr * stmt 
    | Tata ;;


    
(* Token list to Abstract Syntax tree *) 

let parser token_list = 
    let rec parser_help acc l = 
        match l with 
        | [] -> acc 
        |  h :: t when h.kind == KHEL -> (
                                    let capture_khel l1 = 
                                        match l1 with 
                                        | n1 :: n2 :: s :: tail -> parser_help (acc @ [Khel(Int(int_of_string n1.lit_val), Int(int_of_string n2.lit_val), Str (s.lit_val) )]) tail 
                                        | _ -> failwith "Semantic Error"
                                    in capture_khel t
                                    )
        |  h :: t when h.kind == AAOO -> (
                                            let capture_aaoo l1 = 
                                                match l1 with 
                                                | s1 :: s2 :: n1 :: n2 :: tail -> parser_help (acc @ [Aaoo(Var(s1.text), Str(s2.lit_val), Int(int_of_string n1.lit_val), Int(int_of_string n2.lit_val))]) tail 
                                                | _ -> failwith "Semantic Error" 
                                            in capture_aaoo t
                                            )
        | h :: t when h.kind == VAR -> (
                                            let capture_var l1 = 
                                                match l1 with 
                                                | s1 :: n1 :: tail -> parser_help (acc @ [VarDecl(Var(s1.text), Int(int_of_string n1.lit_val))]) tail 
                                                | _ -> failwith "Semantic Error" 
                                            in capture_var t
                                        ) 
        | h :: t when h.kind == ON_KEY -> (* let rec inner_solve stmt_lst =
                                                let rec inner_helper acc ls =  
                                                match ls with 
                                                | h1 :: t1 when h.kind == RIGHT_PAR ->  acc 
                                                | h1 :: t1 -> inner_helper (acc @ parser_help [h] t1)   *)
                                            (let capture_onKey l1 = 
                                                match l1 with 
                                                | s1 :: p1 :: l2 :: p2 :: tail when (p1.kind == LEFT_CURL && p2.kind == RIGHT_CURL)-> parser_help (acc @ [On_Key(Str(s1.lit_val), parser_help [] [l2])]) tail 
                                                | _ -> failwith "Semantic Error" 
                                            in capture_onKey t )
        | h :: t when h.kind == SET -> (
                                            let capture_set l1 = 
                                                match l1 with 
                                                | v1 :: s1 :: tail when v1.kind == VAR -> parser_help (acc @ [Set(Var(v1.text), )])
        )
        

    in parser_help [] token_list ;; *)















(* 
let () = 
    let python_code = "import math\n print(math.pi)" in 
    write_file "math_test.py" python_code *)