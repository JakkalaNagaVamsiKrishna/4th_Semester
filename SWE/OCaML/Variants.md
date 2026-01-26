```ocaml
type primary_color = Red | Green | Blue

let r = Red

type point = float * float

type shapes = 
  | Circle of {center : point; radius : float}
  | Rectangle of {lower_left : point; upper_right : point}
  | Point of point 
  
let c1 = Circle {center = (0., 0.); radius = 1.}
let r1 = Rectangle {lower_left = (-1., -1.); upper_right = (1., 1.)}

let avg a b = (a +. b)/. 2.

let p1 = Point (31., 10.)

let center s = 
	match s with 
	| Circle {center; radius} -> center
	| Rectangle {lower_left = (x_ll,y_ll); upper_right = (x_ur, y_ur)} -> 
		(avg x_ll x_ur, avg y_ll y_ur)
	| Point p -> p
```

# Syntax and Semantics

`Type Definition syntax`
```ocaml
type t = 
| C1 of t1
| C2 of t2 
| ...
| Cn of tn

(*here C1, C2, ..., Cn are constructors these should always start with capital letters*)
```


`Non-Constant variant expressions :`
Syntax : `C e`

`Evaluation :`
if e ==> v then C e ==> C v
`Type checking :`
C e : t
if t = $\dots$ | C of t' | $\dots$ 
and e : t'

`Constant variant Expressions :`

Syntax : C
`Evaluation :` already a value
`Type checking :` 
C : t 
if t = $\dots$ | C | $\dots$ 
