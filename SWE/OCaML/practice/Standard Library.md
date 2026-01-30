```ocaml
(*lists and arrays*)
let l = List.length [1; 2; 3];;
let n_elem = List.nth ["a"; "b"; "c"; "d"] 4 ;;
let a = [| 10; 20; 30 |];;
Array.length a;;

(*String and Sys*)
String.length "hello " ;;
String.uppercase_ascii "software engineering" ;;
String.concat ", " ["a"; "b"; "c"] ;;

let curdir = Sys.getcwd ()
let v = Sys.argv ;;

(* Random *)
let random_int = Random.int 10
let rand_float = Random.float 1.0;;
(* here init statement is like giving a seed it returns unit type *)
let _ = Random.init 42 
let limit = 100
let r1 = Random.int limit 
let r2 = Random.int limit 
(*Everytime we give the same seed we get the same sequence of numbers so it is called pseudo random *)
let _ = Random.init 42
let r3 = Random.int limit;;

Random.self_init();; (*for true randomness*)
                     
(*Random and List*)
let _ = Random.init 42
let random_float_list n = List.init n (fun _ -> Random.float 2.0);;
let floats = random_float_list 3;;
    
let _ = Random.self_init();;
let random_choice lst = List.nth lst (Random.int (List.length lst)) 
let random_car_list n = List.init n (fun _ -> random_choice ["honda"; "tata"; "mahindra"; "maruti"]);;
let car = random_car_list 1;;

(*List.init function*)

List.init n f (*returns a list [f 0; f 1; f 2; ... ; f (n-1) ]*)
(*here f takes the index as input and returns a value*)
```