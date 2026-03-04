This is a basic language for numerical algebraic addition and multiplication. 
We can assign and use variables 


# Language Usage Protocol 

We can use this particular language in two modes 
## 1. REPL MODE 
```
./a.exe    
```
If we directly run the executable file without any arguments, we enter a REPL mode where we can pass each individual line of the program you want to write 

## 2. FILE MODE 
```
./a.exe filename.txt
```
We can write the program we need in an filename.txt file and then pass it as an argument to the executable. By doing this we can run the lines in the file sequentially and get the output of each line in the terminal.

# Commands 

1. add
```
add arg1 arg2
```
used to add the values of any two defined nodes 

2. mult 
```
mult arg1 arg2
```
used to multiply the values of any two defined nodes 

3. set 
```
set varName value
```
used to assign the value to a variable named varName 

Here, Node refers to any constant, assigned variable, binary operator on two defined nodes. 
