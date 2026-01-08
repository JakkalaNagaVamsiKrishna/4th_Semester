
we can use the if expressions using `if then else` syntax.
Ex. `if "batman" >  "superman" then "yay" else "boo";;`
Strings in Ocaml is ordered in lexicographic order (dictionary order).

We cannot used int as a bool as in 0-false, 1-true.
Both the then and else statements should contain the same type .

We cannot leave out else branch (always define else branch for now)

Syntax : 
` if e1 then e2 else e3`
Evaluation          -- here Evaluates to is denoted by ==> 
- if e1 ==> true, and if e2 ==> v, then `if e1 then e2 else e3` ==> v.
- if e1 ==> false, and if e3 ==> v, then `if e1 then e2 else e3` ==> v.
Type Checking :    -- her instead of "has type" we use a colon
	if e1 : bool and e2 : t and e3 : t then `if e1 then e2 else e3` : t .
