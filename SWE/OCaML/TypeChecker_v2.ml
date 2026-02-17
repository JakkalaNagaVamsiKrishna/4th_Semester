(* This is an OCaml editor.
   Enter your program here and send it to the toplevel using the "Eval code"
   button or [Ctrl-e]. *)

(*Type checker using inference rules *)

(*Grammar*)
type typ = 
  | TInt    (* Tn *)
  | TBool    
  | TArrow of typ*typ ;; (*T1 -> T2*)
                      
                
type expr = 
  | Const of int
  | Bool of bool 
  | Var of string 
  | Abs of string * typ * expr 
  | App of expr * expr
  | If of expr * expr * expr
  | Let of string * expr * expr ;;
      
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
  | Const _ -> TInt
  | Bool _ -> TBool
    
(* T-Var rule : lookup the variable in the environment*) 
  | Var x -> lookup x gamma 
               
(* If expression rule *)            
  | If (e1, e2, e3) -> 
      let t1 = typeof gamma e1 in 
      let t2 = typeof gamma e2 in 
      let t3 = typeof gamma e3 in 
      if t1 = TBool then 
        if t2 = t3 then t2 
        else failwith "Type Error : If branches must have the same type"
      else failwith "Type Error : Condition must be a boolean" 
          
(* T-Let rule : *)
  | Let (x, e1, e2) -> 
      let t1 = typeof gamma e1 in 
      typeof ((x, t1) :: gamma) e2 
               
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









