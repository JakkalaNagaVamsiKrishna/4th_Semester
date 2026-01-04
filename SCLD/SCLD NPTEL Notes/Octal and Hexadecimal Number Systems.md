

These systems are a better representation of binary systems.


# Octal Number Systems

- group of three digits are represented by an octal digit.
- octal digits are 0 to 7.

| Binary | Octal |
| ------ | ----- |
| 000    | 0     |
| 001    | 1     |
| 010    | 2     |
| 011    | 3     |
| 100    | 4     |
| 101    | 5     |
| 110    | 6     |
| 111    | 7     |

### Binary to Octal Conversion :

For the integer Part :
- Scan the binary digits from right to left.
- Take 3 digits at a time and convert it to octal.
- If at last less than 3 digits are found add zeroes on the left side.
For the Decimal Part :
- same as integral part but from left to right after decimal point.

### Octal to Binary Conversion :

Translate every octal digit into its 3-bit binary equivalent.

### Decimal to Octal Conversion :

For the integer Part :
same like binary conversion but dividing by 8 instead of dividing by 2 at each step.

For the decimal Part :
Same like binary conversion but multiplying by 8 at each step.

---

# Hexadecimal Number System 

- A compact way to represent binary numbers 
- Group of four binary digits are represented by hexadecimal digit.
- Radix is 16 ( 0-9 A-F ).

| Hex | Binary | Hex | Binary |
| --- | ------ | --- | ------ |
| 0   | 0000   | 8   | 1000   |
| 1   | 0001   | 9   | 1001   |
| 2   | 0010   | A   | 1010   |
| 3   | 0011   | B   | 1011   |
| 4   | 0100   | C   | 1100   |
| 5   | 0101   | D   | 1101   |
| 6   | 0110   | E   | 1110   |
| 7   | 0111   | F   | 1111   |

### Binary to Hexadecimal Conversion 

For the integer Part :
Right to left change 4 bits into one hex-bit.
For the decimal Part :
left to right change 4 bits into one hex-bit.

### Decimal to Radix-r conversion :

For Integer Part :
- Repeatedly divide the number by r and accumulate the remainder . Remainders are arranged in reverse order.
For the fractional Part :
- Repeatedly multiply by r, and accumulate & discard the integer part . The digits are arranged in the order they are generated. 

### Radix-r to Decimal Conversion :

- Multiply each digit by corresponding weight and add them up.




