# Binary Coded Decimal

As the binary addition and subtractions are faster, we need a representation to avoid always converting decimal to binary and binary-decimal.
It is sometimes desirable to manipulate decimal numbers instead of converting them to binary.
### Representation in BCD :
- Each decimal digit is represented by its 4-bit binary equivalent.
- the six 4-bit combinations 1010, 1011, 1100, 1101, 1110, and 1111 are unused.

| Decimal | BCD  |
| ------- | ---- |
| 0       | 0000 |
| 1       | 0001 |
| 2       | 0010 |
| 3       | 0011 |
| 4       | 0100 |
| 5       | 0101 |
| 6       | 0110 |
| 7       | 0111 |
| 8       | 1000 |
| 9       | 1001 |

## Addition of BCD numbers

when we add two BCD numbers , we may have to go for a correction step where 6(0110) is added to one of the nibbles.
- Either when nibble is one of the six invalid combinations
- There is a carry in from the previous nibble.

>[!Question] what happens if one nibble gives an unused value and other nibble has a carry ?

>[!Question] How should we do the addition while adding two 2-digit numbers which gives a 3-digit number. Ex : 55 + 51 = 106.
# Gray Codes

*Gray Code* is a type of non-weighted binary code where successive code words differ in only one bit.
- Any code with this property is called *Cyclic Code*.
- Gray code is useful in many applications that require analog to digital conversion.
	- To reduce error in conversion
	- binary-to-Gray and gray-to-binary conversions are easy.
	- Ex. to measure the angle of rotation of a wheel.
- Gray code is also called the self-reflecting code.

# Binary to Gray Code conversion
let $g_{n-1}g_{n-2}\dots g_{2}g_{1}g_{0}$ be n-bit Gray Code and $b_{n-1}b_{n-2}\dots b_{2}b_{1}b_{0}$ be its binary equivalent. $$g_{n-1} = b_{n-1}$$$$g_{i} = b_{i} \oplus b_{i+1} \space for \space 0 \le i \le n-2$$ 
- Here the  $\oplus$  symbol represents the modulo-2 sum (Also XOR gate).

# Gray Code to Binary code conversion
- We start from leftmost bit and proceed to least significant bit, and set:
	- $b_{i} = g_{i}$, if no. of 1's preceding $g_{i}$ is even
	- $b_{i} = g_{i}'$  , if no. of 1's preceding $g_{i}$ is odd.
