every expression has :
- Syntax
- Semantics :
	Static semantics (Type checking rules) : produce a type, or fail with an error message.
	Dynamic Semantics (Evaluation Rules) : produce a value, or exception or infinite loop.

`Values : a value is an expression that does not need any further evaluation`

```Ocaml
3110;;
" output  (- : int = 3110)"
```

the output is read from right to left, 3110 is our value, int is our type.

Some operators :

` String concatenation : "big" ^ "red" => "bigred"`

if we use `2.0 * 3.14` we get an error message because there are 2 types of separate arithmetic operators for int and float datatypes.
For float datatypes we need to use `2.0 *. 3.14` to do the multiplication.

# Type inference

Ocaml compiler infers types
- compilation fails with type error if it can't
- Hard part of language design : guaranteeing compiler can infer types when program is correctly written.
Ocaml does type checking like Java at compile type while python doesn't.

You can manually annotate types anywhere 
- Replace e with ( e : t ) here e is the value and t is the type. (Ex. ( 3110 : int))
- Useful for diagnosing type errors.

the annotation is not the exact same as type cast because here we cannot assign 3110 to be a bool but in typecasting we can do it.


