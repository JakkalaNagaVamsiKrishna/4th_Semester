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

