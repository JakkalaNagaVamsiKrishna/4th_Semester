
## Conventions in binary numbers

`Bit : single binary digit.`
`Nibble : collection of 4 bits.`
`Byte : collection of 8 bits.`
`Word : collection of 16/32/64 bits` (changes based on context)

==$2^n$== numbers can be represented in n-bits(0-$(2^n-1)$).
A signed number has both magnitude and also a sign.

### Representation of a unsigned binary number
$$ b_{n-1}b_{n-2}\dots b_{2}b_{1}b_{0}  =  b_{n-1}2^{n-1} + b_{n-2}2^{n-2} + \dots + b_{1}2^{1} + b_{0}2^0 $$
$b_{0}$ is the least significant binary digit.
$b_{n-1}$ is the most significant binary digit.

### Signed Integer Representation

1. Sign magnitude representation
     - The most significant bit indicates sign (0:positive, 1:negative).
     - remaining n-1 bits represent the magnitude of the number.
     - Range : $-(2^{n-1}-1)$ to $(2^{n-1}-1)$
    - Faults :
    - two different representations of zero 
    - +0 : 000000...      -0 : 100000...

2. one's component representation
     - Positive numbers are represented exactly as in sign-magnitude form.
     - Negative numbers are represented in 1's complement form of the magnitude.
     - MSB will indicate sign of the number.
     - Range : $-(2^{n-1}-1)$ to $(2^{n-1}-1)$
     - Problem : 2 different representations of zero.
     - Advantages : subtraction can be done using addition.

3. two's component representation (Mostly Used)
     - Positive numbers are represented as in sign-magnitude form.
     - For negative numbers :
      Complement every bit of the number and then add 1 .
     - Range :  $-(2^{n-1})$ to $(2^{n-1}-1)$

Some other features of 2's complement representation :
     $$a) D= -b_{n-1}2^{n-1} + b_{n-2}2^{n-2} + \dots + b_{1}2^{1} + b_{0}2^0$$
 
b) Shift left by k positions with 0 padding - multiply by $2^k$.
c) Shift right by  k positions with sign bit padding divides the number by $2^k$.
d) The sign bit can be copied as many times as required in the beginning to extend the size of the number (called sign extension).

$$00101011 = 00000000 00101011$$
$$10101 = 11111111110101$$
