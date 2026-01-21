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
- match shape of data 
- extract elements of data
