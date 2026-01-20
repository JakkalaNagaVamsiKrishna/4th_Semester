# Lists

- Immutable : can't change elements
- Singly- linked :
	 - good for sequential access of short to medium length lists
	 - Data structures are tools: none is perfect
```ocaml
[];; (*output ->  - : 'a list = [] *)
[1;2;30];; (*output -> - : int list = [1; 2; 3] *)
(*we can also write nested lists*)
[[1; 2]; [3; 4]; [5; 6]];; (*output -> - : int list list = [[1; 2]; [3; 4]; [5; 6]] *)
(*we can create lists using concatenation operator *)
1 :: [2; 3];; (*output -> - : int list = [1; 2; 3]*)
1 :: 2 :: 3 :: [];; (*output -> - : int list = [1; 2; 3]*)
```

`Syntax :`
- empty list :  [ ]
- e1 :: e2 prepends element e1 to list e2
- [e1; e2] is sugar for e1 :: e2 :: [ ] 

`[ ]` is pronounced "nil"
`:: `is pronounced "cons" 

`List Semantics :`
- `[ ]` is a value
- To evaluate e1 :: e2 
	- evaluate e1 to a value v1 
	- evaluate e2 to a (list) value v2 and
	- return v1 :: v2

`List types :` For any type t , the type `t list` describes lists where all elements have type t.


# Records 

```ocaml
type student ={
  name : string;
  year : int   (*here name and year are fields*)
}

let nvk = {
  name : "Naga Vamsi";
  year : 2028
}
(*nvk.mae accesses field `f` of a record expression nvk *)
(*ocaml automatically infers the datatype student*)
(*Record Copy : This is not mutation but creating a copy *)
{e with f1 = e1;f2 = e2; f3 = e3} 
{nvk with name = "vamsi"; year = 2025}

```

# Tuples 

 ```ocaml
 type time = int * int * string
 
 let t = (10, 10, "am")
 
 type point = float * float
 
 let p : point = (5.0,3.5)
 ```
