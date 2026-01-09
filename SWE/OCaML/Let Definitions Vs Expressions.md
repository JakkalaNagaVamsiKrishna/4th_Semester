# Let Definitions
- A definition gives name to a value. 
- It's value cannot be changed.
- we can also explicitly mentioned `let y : int = 3110;;` 

>[!Note] Definitions :
A definition gives a name to a value. Definitions are not expressions, or vice-versa but definitions syntactically contain expressions.

Syntax :
`let x=e` where `x` is an identifier 
identifiers should start with lowercase letter

Evaluation :
- Evaluate e to a value v.
- Bind v to x :Henceforth, x will evaluate to v(under the hood: there is a memory location named x that contains v)

# Let Expressions
- the main difference is the usage of `in` keyword.
- Ex. `let b = 1 in 2*b;;`
- it means we use the name b for 1 only inside that particular expressions.

We can nest these expressions.
`let c=3 in (let d=4 in c+d);;`

`let e=5 in (let e=6 in e);;` the output will be 6.
