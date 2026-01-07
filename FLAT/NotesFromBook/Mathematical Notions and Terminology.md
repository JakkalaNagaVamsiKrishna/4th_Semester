
> [!Note] Sets :
A Set is a group of objects represented as a unit. The objects in a set are called its elements or members. 

- For two sets A and B , A is a *subset* of B ($A \subseteq B$) if every member of A is also a member of B.
- *Proper Subset* : A is a proper subset of B $A \subset B$ if A is a subset of B and not equal to B.
- If we want to take the number of occurrences of members into account, we call it a multiset.
- 0 elements : empty set , 1 element : singleton set , 2 elements : unordered pair.
- the *Union* of A and B, written as $A \cup B$, is the set we get by combining all elements in A and B into a single set.
- the *intersection* of A and B written as $A \cap B$, is the set of elements that are in both A and B.
- The *Complement* of A written $A^c$ is the set of all elements under consideration that are not in A.

>[!Note] Sequence :
A sequence is a list of objects in some order. repetition does matter in a sequence.

-  (7,5,9) is not equal to (7,7,5,9) or (7,9,5).
- Finite sequences are called tuples. k- elements => k-tuple.
- A 2-tuple is called an ordered pair.
- Cartesian product or cross product of A and B , written A x B, is the set of all ordered pairs wherein the first element is a member of A and the second element is a member of B.

>[!Note] Function :
A function takes an input and produces an output. a function is also called a mapping. In every function, same input always produces the same output.

- the set of all possible input values of a function is called Domain.
- The outputs of a function come from a set called Range.
- we can describe a function in two ways :
	- One way is a procedure for computing an output from a specified input.
	- Another way is with a table that lists all possible inputs and gives the output for each input.

- a function with k-arguments is called a k-ary function and k is called arity of the function.
- certain familiar binary functions are written in *infix notation* with the symbol placed in between the two arguments (a + b). 
- *Prefix notation* : add(a, b).
>[!Note] Predicate/property :
A predicate or property is a function whose range is {TRUE, FALSE}.

- A property whose domain is a set of k-tuples is called a relation(k-ary relation).
- if R is a binary relation, then the statement aRb means that aRb = TRUE .
- if R is a k-ary relation, the the statement R($a_{1}, a_{2}, \dots, a_{k}$) means that R($a_{1}, a_{2}, \dots, a_{k}$) = TRUE.
- A binary relation R is an equivalence relation if R satisfies three conditions.
	- R is *reflexive* if for every x, $xRx$.
	- R is symmetric if for every $x$ and $y$ , $xRy$ implies $yRx$ 
	- R is transitive if for every $x, y$ and $z$ , $xRy$ and $yRz$ implies $xRz$.

> [!Note] Graphs :
A undirected graph or simply a graph is a set of points with lines connecting some of the points. The points are called *nodes* or *vertices* and the lines are called *edges*.

- The number of edges at a particular node is the *degree* of that node.
- we may allow an edge from node to itself, called a *self-loop*.
- (i, j) or {i, j} represents an edge between nodes i and j.
- If V is the set of nodes and E is the set of edges we say, $G = (V,E)$.
- we label the nodes and/or edges of a graph, which then is called a labelled graph.
- A path in a graph is a sequence of nodes connected by edges.
- A simple path is a path that doesn't repeat any nodes.
- A path is a cycle if it starts and ends in the same node.
- A simple cycle repeats only first and last nodes.
- A graph is *tree* if it is connected and has no simple cycles.
- nodes of degree 1 in a tree, other than the root are called leaves.
- A *directed graph* has arrows instead of lines. The number of arrows pointing from a particular node is the outdegree. The number of arrows pointing to a particular node is the indegree.
- A path in which all the arrows point in the same direction as its steps is called a *directed path*.
- A directed graph is *strongly connected* if a directed path connects every two nodes.

# Strings and languages

We define an *alphabet* to be any nonempty finite set. The members of the alphabet are the symbols of the alphabet.
we generally use capital Greek letters $\sum$ and $\Gamma$ to designate alphabets.

A *string over an alphabet* is a finite sequence of symbols from that alphabet usually written next to each other and not separated by commas.

- The string of length 0 is called empty string and is written as $\epsilon$  
- if $w$ has length n, we can write $w = w_{1}w_{2}w_{3}\dots w_{n}$ where each $w_{i} \in \sum$. The reverse written as $w^R$, is the string obtained by writing w in the opposite order.
- String z is a substring of w if z appears consecutively within w.
- If we have string x of length m and string y of length n, the concatenation of x and y, written $xy$ is a string obtained by appending y at the end of x.
- *Lexicographic order* : same as familiar dictionary order.
- *Shortlex or string order* : similar to lexicographic but shorter strings precede longer strings. Ex. the string ordering of strings over alphabet {0,1} is $(\epsilon, 0, 1, 00, 01, 10, 11, 000 \dots)$.
- string x is a *prefix* of string y if a string z exists where $xz = y$, and that x is a *proper prefix* of y in addition if $x \neq y$. 
- A *language* is a set of strings.
- A language is *prefix free* if no member is a proper prefix of another.
- 