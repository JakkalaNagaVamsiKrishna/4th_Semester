```ocaml 
(*These are variants*)
type shape = 
  | Circle of float 
  | Point 
  | Triangle of float * float 
                
type color = 
  | Red
  | Green 
  | Blue 
   
(*This is a record*) 
type shapes = {
  shape_color : color;
  shape : shape ;
  id : int ;
}

let s1 = {id = 23; shape_color = Red; shape = Circle 2.5}
let s2 = {id = 42; shape_color = Green; shape = Point}
let sh = s1.shape;;

(*Ambiguity -- no error here but error expected*)
let shape = Point
let show_shape sh = match sh with 
  | {shape ; id ; shape_color} -> shape;;

show_shape s1;;

let show_id sh = match sh with 
  | {id; _ } -> id;;
show_id s1;;


(*We can write conditionals using when keyword*)
let is_red_or_id_more sh = 
  match sh with 
  | {shape_color = Red; _} -> true
  | {id; _} when id > 30 -> true
  | _ -> false 
    
let check1 = is_red_or_id_more s1;;
let check2 = is_red_or_id_more s2;; 

(*Aliases allow to give name to a custom type*)
type coordinate = float*float;;
let x_y:coordinate = (1.2, 2.3);;
(*aliases can be used to name parameters*)
let sum_nums (x, y) = x + y;;
let foo ((x, y) as arg) = sum_nums arg;;
foo (1, 2);;

(*Unit Testing*)
let add x y = x + y;;
let add_test () = add 2 3 = 5 && add 10 2 = 12 && add 50 50 = 100;;
add_test ();;

let unit_test_helper (test : bool) (msg : string)  : unit = if test then Printf.printf "%s PASS\n" msg else Printf.printf "%s FAIL\n" msg ;;
let add x y = x + y;;
let add_test () = 
  unit_test_helper (add 2 3 = 5) "Adding 2, 3";
  unit_test_helper (add 4 3 = 7) "Adding 4, 3";
  unit_test_helper (add 20 30 = 5) "Adding 20 30";;
add_test ();;
```