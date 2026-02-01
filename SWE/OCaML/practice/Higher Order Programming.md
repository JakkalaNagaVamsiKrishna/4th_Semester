```ocaml
(*Higher Order Progrmming*)

(*Map Abstraction*)
let rec incr_elements (inp : int list) : int list = 
  match inp with 
  | [] -> []
  | head :: tail -> (1 + head) :: (incr_elements tail);;

let rec sqr_elem (inp : int list) : int list = 
  match inp with 
  | [] -> [] 
  | head :: tail -> (head*head) :: (sqr_elem tail);;

let rec map (f : int -> int) (inp : int list) : int list = 
  match inp with 
  | [] -> []
  | head :: tail -> (f head) :: (map f tail);;(*here f can be an anonymous function*)

(*Fold abstraction *)

let rec sum (inp : int list) : int = 
  match inp with 
  | [] -> 0
  | head :: tail -> (head + (sum tail));;

let rec prod (inp : int list) : int = 
  match inp with 
  | [] -> 1
  | head :: tail -> (head * (prod tail));;

let rec fold (f : int -> int -> int) (inp : int list) (acc : int) : int = 
  match inp with 
  | [] -> acc 
  | h :: t -> f h (fold f t acc);;
                
(*Filter Abstraction*)

let rec evens inp = 
  match inp with 
  | [] -> []
  | h :: t -> if (h mod 2 = 0) then h :: evens t else evens t;;

let rec odds inp = 
  match inp with 
  | [] -> []
  | h :: t -> if (h mod 2 <> 0) then h :: odds t else odds t;;

let rec filter predicate l = 
  match l with 
  | [] -> []
  | h :: t -> if (predicate h) then h :: filter predicate t else filter predicate t;;
  ```
