```ocaml
(* Traffic light *)
type traffic_light = 
  | Red
  | Yellow
  | Green
  
let action l = 
  match l with 
  | Red -> "Stop"
  | Yellow -> "Ready"
  | Green -> "Go" ;;

(* Area function *)
type shape = 
  | Circle of float
  | Rectangle of float * float
  | Square of float 
      
let area s =
  match s with 
  | Circle r -> 3.14 *. r *. r
  | Rectangle (l, b) -> l *. b
  | Square a -> a *. a ;;

(* student exam marks*)
type result = 
  | Pass of int
  | Fail of int
  | Absent
    
let is_pass r = 
  match r with 
  | Pass m -> true
  | Fail m -> false
  | Absent -> false
    
let marks r = 
  match r with     (*here we should add Some to make the type option to return None*)
  | Pass m -> Some m
  | Fail m -> Some m
  | Absent -> None
    
(* Login Status *)

type login_status = 
  | LoggedIn of string
  | LoggedOut
  | Suspended of int 
      
let message = function 
  | LoggedIn name -> "Welcome " ^ name
  | LoggedOut -> failwith "User is not logged in"
  | Suspended days -> "Suspended for "^ (string_of_int days) ^"days" 

(*own list type*)
type int_list = 
  | Nil 
  | Cons of int * int_list
            
let rec length = function 
  | Nil -> 0
  | Cons (n, l) -> 1 + length l

let rec sum = function 
  | Nil -> 0
  | Cons (n, l) -> n + sum l
                     
(* Arithmetic expression evaluator *)
type expr = 
  | Num of int
  | Add of expr * expr
  | Mul of expr * expr
           
let rec eval = function
  | Num n -> n
  | Add (e1, e2) -> (eval e1) + (eval e2)
  | Mul (e1, e2) -> (eval e1) * (eval e2) 
                                
(* This is the binary tree implementation *)


type tree = 
  | Empty 
  | Node of int * tree * tree
            
let max x1 x2 = if x1>x2 then x1 else x2  
  
let rec size = function
  | Empty -> 0
  | Node (v, t1, t2) -> 1 + size t1 +  size t2
                          
let rec height = function 
  | Empty -> 0
  | Node (v, t1, t2) -> 1 + max (height t1) (height t2)
                          
let rec inorder = function 
  | Empty -> [] 
  | Node (v, t1, t2) ->  [v] @ inorder t1  @ inorder t2
                          
type result = 
  | Ok of int 
  | Error of string 
      
let safe_div num den = 
  match den with 
  | 0 -> Error "Cannot divide by zero"
  | _ -> Ok (num / den) ;;

(* Command interpreter*)
type command = 
  | Add of int
  | Sub of int
  | Reset
    
let apply_command state cmd = 
  match cmd with 
  | Add x -> state + x
  | Sub x -> state - x
  | Reset -> 0
    
let rec interpret state cmds =
  match cmds with 
  | [] -> state
  | cmd :: rest -> let new_state = apply_command state cmd in interpret new_state rest 
        
let run cmds = interpret 0 cmds 
    
  
(*Expression with variable *)
type expr =
  | Num of int
  | Var of string 
  | Add of expr * expr
           
type env = (string * int) list 
    
let rec lookup x env = 
  match env with 
  | [] -> failwith "Unbound value x"
  | (y, v) :: rest -> if x=y then v else lookup x rest 
          
let rec eval env e = 
  match e with 
  | Num n -> n
  | Var v -> lookup v env
  | Add (e1, e2) -> (eval env e1) + (eval env e2)
                      
  
(*Dispenser Mechanism*)

type state = 
  | Idle 
  | HasMoney of int
  | Dispensing
    
type input = 
  | InsertCoin of int
  | SelectItem of int
  | Cancel 
  | DispenseDone
    
type output = 
  | Message of string 
  | ReturnMoney of int
  | DispenseItem
  | Error of string 
      
let transition state input = 
  match state, input with 
  | Idle, InsertCoin amount -> (HasMoney amount, Message "Money inserted")
  | HasMoney money, InsertCoin amount -> (HasMoney (money + amount), Message "We are rich")
  | HasMoney money, SelectItem price -> 
      if money >= price then (Dispensing, DispenseItem) else (HasMoney money, Error "Insufficient balance")
  | HasMoney money, Cancel -> (Idle, ReturnMoney money)
  | Dispensing, DispenseDone -> (Idle, Message "Thank you")
  | _, _ -> (state, Error "Invalid operation")
```