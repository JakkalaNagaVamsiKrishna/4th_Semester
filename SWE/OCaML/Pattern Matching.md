```ocaml
let x = match not true with 
| true -> "nope"
| false -> "yep" 

(*similar to switch statement*)

let y = match 42 with 
| fooo -> fooo

let z = 
match "foo" with 
| "bar" -> 0
| _ -> 1    (* _ is the wildcard operator*)

let a = match [] with 
| [] -> "empty"
| _ -> "not empty"

let a = match [1; 2] with 
| [] -> "empty"
| _ -> "not empty"

let b = match ["taylor"; "swift"] with
| [] -> "folklore"
| h :: t -> h (*here we cannot use t because it is a string list*)

let fst3 t = 
match t with 
| (a, b, c) -> a

fst3 (1, 2, 3) (*output : - : int = 1*)

let nvk = {
  name : "Naga Vamsi";
  year : 2028
}

(*let's try to write our name with year*)
let name_with_year s = 
match s with 
| {name; year} -> name ^ "' " ^ (string_of_int year)mod 100

name_with_year nvk (*output : - : string = "Naga Vamsi' 28"*)
```

Pattern matching let's us do 
- match shape of data 
- extract elements of data

# pattern matching with lists

A list can only be :
- nil or
- the cons of an element onto another list

```ocaml
let empty lst = 
  match lst with 
  | [] -> true
  | _ -> false
  
  
let rec sum lst = 
  match lst with 
  | [] -> 0
  | h :: t -> h + sum t
```

`#trace fn_name :` this directive built into utop displays all the function calls and return values of a function call
```ocaml
let rec sum lst = 
  match lst with 
  | [] -> 0
  | h :: t -> h + sum t ;;
  
#trace sum;;

sum [1; 2; 3];;

(*output : 
--> indicates return value 
<-- indicates function call
sum <-- [1; 2; 3]
sum <-- [2; 3]
sum <-- [3]
sum <-- []
sum --> 0
sum --> 3
sum --> 5
sum --> 6
*)

(*example usage :
	append [1; 2; 3] [4; 5; 6] is [1; 2; 3; 4; 5; 6]*)
let rec append lst1 lst2 = 
  match lst1 with 
  | [] -> lst2
  | h :: t -> h :: (append t lst2)
  
[1; 2; 3] @ [4; 5; 6] = append [1; 2; 3; 4; 5; 6] 
```

# `function` keyword

```ocaml

let f x y z = 
  match z with 
  | p1 -> e1
  | p2 -> e2

(*can be written as*)

let f x y = function
  | p1 -> e1
  | p2 -> e1
```

# `:: vs @`

`::` 
-  cons
- Add an element onto the head of a list
- 'a -> 'a list -> 'a list 
- constant time : O(1)

`@` 
- 'append'
- combine two lists
- 'a list -> 'a list -> 'a list 
- Linear time in first list :
	- for `lst1 @ lst2` it's O( length lst1)

# Syntax and Semantics

`Syntax :`
```ocaml
match e with 
  | p1 -> e1
  | p2 -> e2
```
can have more branches, or even just one

`p` is a new syntactic class : Pattern expressions

`Match expressions :`

Evaluation : 
- If e ==> v
	- and pi is the first pattern, top-to-bottom that matches v
	- and ei ==> vi
	- Then (match e $\dots$) ==> vi
- But if no patterns match, raise an exception `Match_failure`

Type-Checking :
If e and pi have type `ta` and ei have type `tb` then the entire match expression has type `tb` 

$e_{1}, e_{2}, e_{3} \dots en$ should have the same type

`Semantics :`
- A constant matches itself
- An identifier aka pattern variable matches anything and binds it in the scope of the branch
- The `_` aka wildcard matches anything but doesn't bind it.

# Static checking of Patterns 
```ocaml

(*
Exhaustiveness of Patterns
redundance of branches
*)

let bad_empty lst = 
  match lst with 
  | [] -> true 

(* this is not exhaustive for non-empty lists *)

let good_empty lst = 
  match lst with 
  | [] -> true
  | _ -> true
  
let sum lst = 
  match lst with 
  | h :: t -> h + sum t
  | [x] -> x
  | [] -> 0 
(*here the second branch is redundant because it is always covered in first branch*)

let rec bad_sum lst = 
  List.hd lst + bad_sum (List.tl lst)


(*
List.hd [1; 2; 3] = 1
List.tl [1; 2; 3] = [2; 3]
List.tl [] = Exception : Failure "tl".
List.hd [] = Exception : Failure "hd".
*)
```