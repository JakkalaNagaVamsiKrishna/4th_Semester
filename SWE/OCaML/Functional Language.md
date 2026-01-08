- defines computations as mathematical functions
- avoids mutable state.

`State : the information maintained by a computation.`

`Mutable : can be changed`


- Mutability breaks referential transparency: ability to replace expression with its value without affecting result of computation.

# Imperative Programming

1. Commands specify how to compute by destructively changing state.
Ex : x=x+1; $a[i]$ = 41;   p.next = p.next.next;

2. Functions or methods have side effects :
```c
int x=0;
int incr_x(){
	x++;
	return x;
}
```


# Functional Programming

Expressions specify what to compute 
- variables never change values (so a better notation would be identifiers)
- functions never have side effects.

The reality of immutability :
- no need to think about state.
- powerful ways to build correct programs.

This paradigm make the debugging easier.

# Why Study Functional Programming 

1. Functional languages teach you that programming transcends programming in a language.
	same like learning a new language increases your knowledge or help clarify some concepts which are doubtful earlier.
`Quote : A language that doesn't affect the way you think about programming is not worth knowing.` - Alan J. Perlis
2. Functional languages can predict the future.
	- Garbage collection Java[1995], LISP[1958].
	- Generics Java5[2004], ML[1990].
	- Higher -order functions
	- Type inference (because of template programming)
	- the next may be the pattern matching 
3. Functional languages are sometimes used in industry.
4. Functional languages are elegant.
	- Elegant code is easier to read and maintain.
	- Elegant code might not be easier to write.


