```ocaml 
let first_elem lst : int = match lst with 
  | [] -> raise Exit 
  | h :: _ -> h ;;

let f = first_elem [1; 2; 3];;
let v = first_elem [];; (*Exception : Stdlib.Exit*)
  
                        
exception Empty_list_error    (*Custom exception*)
let first_elem lst : int = match lst with 
  | [] -> raise Empty_list_error
  | h :: _ -> h;;
let v = first_elem [] ;;
let f = first_elem [1; 2; 3];;

exception Not_Found of int (*Custom exception with Data*)
let get_html_text req = match req with 
  | "GET" -> "<html>Text</html>"
  | _ -> raise (Not_Found 404) ;;

(*Pattern matching with exceptions *)
exception Not_Found of int;;
let get_html_text req = match req with 
  | "GET" -> "<html>Text</html>"
  | "CUT" -> raise Exit
  | "ABCD" -> raise (Failure "Failed here")
  | _ -> raise (Not_Found 404);;
           
let find_the_exception f = 
  try 
    f ()
  with 
  | Not_Found 404 -> "HTML not found error"
  | Failure _ -> "HTML failed"
  | Exit -> "HTML exit";;

let no_error = find_the_exception ( fun () -> get_html_text "GET");;
let er3 = find_the_exception ( fun () -> get_html_text "XY");;
let er1 = find_the_exception ( fun () -> get_html_text "CUT" );;
let er2 = find_the_exception ( fun () -> get_html_text "ABCD" ) ;;

(*Approximating pi using monte-carlo method*)

Random.self_init ();;
let random_point () = 
  let x = 2.0 *. Random.float 1.0 -. 1.0 in 
  let y = 2.0 *. Random.float 1.0 -. 1.0 in 
  (x, y);;

let is_inside (x, y) = x*.x +. y*.y <= 1.0 ;;

let monte_carlo_pi n = 
  let rec loop i count_inside = 
    if(i = n) then (4.0 *. float_of_int count_inside /. float_of_int n)
    else 
      let new_point = random_point () in 
      let count_inside = if (is_inside new_point) then (count_inside + 1) else count_inside in 
      loop (i+1) count_inside 
  in
  loop 0 0 ;;
  
  
(*
[] has type 'a list here 'a can be anything it can also be 'c list
[[]] has type 'b list list 
therefore [] and [[]] can be of same type so we can use [] and [[]] as same type in pattern matching
*)
```