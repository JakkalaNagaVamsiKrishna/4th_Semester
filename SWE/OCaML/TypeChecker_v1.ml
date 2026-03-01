(*Type checker using inference rules *)

(*Grammar*)
type typ = 
  | TInt    (* Tn *)
  | TArrow of typ*typ ;; (*T1 -> T2*)
                      
                
type expr = 
  | Var of string 
  | Abs of string * typ * expr 
  | App of expr * expr 
  | Const of int 
      
(* The Environment *)
type env = (string * typ) list (*Alias for environment type*)
                               
(* Implementing the map functionality *)
(* Function to lookup the variable type in environment*)
let lookup (x : string) (gamma : env) : typ = 
  try List.assoc x gamma 
  with Not_found -> failwith ("Unbound variable: " ^ x);;

let rec typeof (gamma : env) (e : expr) : typ = 
  match e with 
  (*Constant inference rule*)
  | Const i -> TInt
    
(* T-Var rule : lookup the variable in the environment*) 
  | Var x -> lookup x gamma 
               
(* T-Abs Rule : Add x:t1 to gamma and check the body e *) 
  | Abs (x, t1, e) -> let t2 = typeof ((x, t1) :: gamma) e in TArrow (t1, t2) 
        
(* T-app Rule : Check e1 and e2, then ensure types match *)
  | App (e1, e2) -> 
      let type_func = typeof gamma e1 in 
      let type_arg = typeof gamma e2 in 
      match type_func with 
      | TArrow(t_in, t_out) -> if t_in = type_arg then t_out else failwith "Type mismatch : Argument does not match function input"
      | _ -> failwith "Type Error : Attempted to apply a non-function" ;;
    
(* Representing: fun (x:T1) -> fun (x:T2) -> x *)
let example = Abs ("x", TInt, Abs ("x", TArrow(TInt, TInt), Var "x"));;

let result = typeof [] example;;
(* Result: TArrow(TInt, TArrow(TArrow(TInt, TInt), TArrow(TInt, TInt))) *)









