
# let definitions in top level

`let x = e` is implicitly "in rest of what you type".


>[!Note] Scope
The scope of a variable is where its name is meaningful

```ocaml
let x = 42 in 
 (* y is not meaningful here *)
 x + (let y="3110" in 
			 (* y is meaningful here *)
			 int_of_string y)
```

### Overlapping Scope 

```ocaml
let x = 5 in 
	((let x = 6 in x) + x)
```

It's confusing so we should not use this because it's not easily readable.

`Principle of Name Irrelevance :` the name of variable shouldn't intrinsically matter.
To ensure name irrelevance in programs, stop substituting when you reach a binding of the same name.



