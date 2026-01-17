input and outputs are side effects in Ocaml which means they do not do any computation but affect the values of the variables.

# INPUT
- input functions read data from the standard input(`stdin`). reading starts when the `( )` value of type `unit` is passed as an argument to the input function.
- `read_line () :` Reads a line from the user up to the newline character and returns it as a *string*.
- `read_int ( ) :` reads a line and converts to int. if not int -> raises an error.
```ocaml
let user_input = read_line ()
```
 
# OUTPUT
- Output functions write data to the standard output (`stdout`) and typically return the unit value ( `()` ) to indicate that their purpose is a side effect, not to return a meaningful value.
- `print_string "..." ` : Prints a string to the console.
- `print_endline "..."` : prints a string followed by a newline character, also flushing the output buffer.
- `print_int n` : prints an integer .
- `Printf.printf "format_string" ... ` : Provides C-style formatted output for multiple types using format specifiers like `%s` (string) ,`%F` (float). the `%!` specifier ensures the output buffer is flushed immediately.
```ocaml
print_endline "Hello, World";;
print_int 42;;
print_newline ();; (*adds a newline after the integer*)
Printf.printf "The answer is %d and pi is %F \n %!" 42 3.14159;;
```


