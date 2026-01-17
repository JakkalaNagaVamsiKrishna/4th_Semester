# Anonymous function 

 means the value is unprintable.

```ocaml
(fun x->x+1);;
- : int -> int = <fun> (*here fun is an unprintable value.*)
```

To call a function :
`(fun x -> x+1) 3110` here ( ) can be omitted. output : `- : int = 3111`

Functions with multiple arguments:
```ocaml
	(fun x y -> (x +. y) /. 2.);;
	output : - : float -> float -> float = <fun> 
```
``

# Anonymous function expression 

`Syntax :` fun $x_{1}  x_{2} \dots x_{n}$ -> e

Evaluation :
- A function is a value: no further computation to do.
- In particular , body e is not evaluated until function is applied.

# Functions are values 
we can use them anywhere we use values.
- functions can take functions as arguments
- function can return functions as results.
 This is an incredibly powerful language feature.
 
# Function Application

Syntax : e0 e1 e2 ... en:
1. Evaluate subexpressions :
	e0 ==> v0, ..., en==> vn.
	v0 must be a function:
	 fun x1 x2 ... xn -> e
2. Substitute vi for xi in e yielding new expression e' . Evaluate it : e' ==> v
3. Result is v.

```ocaml
(fun x -> x+1) (2+3)
(* here e0 is already a function so it is a value , we need to evaluate the remaining expressions 2+3 is the only expression so we evaluate it to 5. now we apply the function returned by e1 on the others as parameters*)
(fun x -> x+1) 5
5 + 1 (*this is the expression e' *)
6

(fun x y -> x-y) (3*1) (3-1)
(fun x y -> x-y) 3 2
3 - 2 
1 
```

`Naming a Function :`
we can name a function by directly assigning it an anonymous function as a value.
Ex. `let inc = fun x -> x+1;;`
This will return a type `val inc : int -> int = <fun>`

We can avoid this redundant fun keyword by using another type of syntax.
`let inc x = x+1;;` In this style we directly place the arguments beside the name of the function and replace arrow mark with an = sign.

These two codes are syntactically different but *semantically* equivalent.

# Recursive function definition

- We must explicitly state that the function is recursive.
- Syntax : *let rec name*.
``` ocaml
let rec fact n = 
  if n = 0 then 1
  else n * fact n - 1
(* we can't leave it without brackets because ocaml parses in this way n * (fact n) - 1 and we will get an infinite loop stack overflow.*)

let rec fact n = 
  if n= 0 then 1
  else n * fact (n-1)
(*this way we will get the correct function definition*)
```


# Partial application
```ocaml
let add x y = x+y;;
(*add 2 3    - output : - : int = 5*)
(*add 2 - forms a partially applied function which takes an argument and add 2 to it*)
let add2 = add 2;;

```
### Multi-argument functions do not exist

`fun x y -> e` is syntactic sugar for `fun x -> (fun y -> e)`

`let add x y = x + y` is syntactic sugar for `let add = fun x -> fun y -> x+y`

### functions are values
- functions can take functions as arguments
- functions can return function as results

#### identity function :

`let id x = x;;` has the type `val id : 'a -> 'a= <fun>

# Type variables
`Variable` : name standing for unknown value.
`Type Variable :` name standing for unknown type.

Ocaml Syntax : single quote followed by identifier
eg. 'foo, 'key, 'value. but most often just 'a pronounced "alpha'

# Polymorphism

- write function that works for many arguments regardless of their type.
- closely related to Java Generics and c++ template instantiation.
- this is known as parametric polymorphism

# Operators as functions

if we wrap a binary operator in ( ) parenthesis, it becomes a function
while using * operator as a function we should give spaces inside the parenthesis otherwise it will understand it as opening a comment 
```ocaml
1 + 2;; (*output : - : int = 3*)
( + ) 1 2;; (* we get the same output*)
( * ) 1 2;; (*output : - : int = 2*)
( = ) ;; (*output : - : 'a -> 'a -> bool = <fun> *)
(* the function type is as above and alpha is the datatype which changes according to the arguments of the function*)
(* both the arguments need to be of same type otherwise we will get an error*)

(* we can write our own custom comparision operators*)
(* changing the max function as an infix operator - arg1 operator arg2*)
let ( <^> ) x y = max x y;;  (* val ( <^> ) : 'a -> 'a -> 'a = <fun>*)
1 <^> 2 ;; (*output - : int = 2 *)
```

# Application Operators

- Application `let (@@) f x = f x`
- reverse application / pipeline : `let (|>) x f = f x`

```ocaml
succ;; (* - : int -> int = <fun>*)
succ 1;; (* - : int = 2*)
succ 2*10 (* => (succ 2)* 10 the output will be 30*)
(*to avoid this precedence confusion we can use paranthesis but it will be ugly in the large operational sequences*)
succ (2*10);;
succ @@ 2 * 10 (* - : int = 21*)
(*utop sees this as the thing before @@ operator is the function and the thing after @@ is a single expression which should be evaluated and passed as argument to that function*)

let square x = x * x;; (*val square : int -> int = <fun>*)
square (succ 5);; (*output 36*)
(*if we write it without parantheses it will not make any sense as the square function tries to take the succ as argument*)
square succ 5 ;; (*gives an error*)
succ( square (square (succ 5)));; (*output : 1297 *)
5 |> succ |> square |> square |> succ (*output : 1297*)
(*this reads from left to write the first element is an argument and the following are the sequence of functions from the inside *)
```
