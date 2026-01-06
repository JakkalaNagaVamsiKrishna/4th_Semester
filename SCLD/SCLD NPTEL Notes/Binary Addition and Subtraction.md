# Binary Addition

- corresponding bits are added, and if a carry 1 is produced, it is added to the binary digits at the left.

### Subtraction using Addition in 1's Complement 
- To find : A-B
- compute the 1's complement of B (say, B).
- compute R = A+ $B_{1}$
- if a carry is obtained after addition is '1':
	add the carry back to R (called end-around carry).
	that is, R=R+1.
	The result is a positive number. 
- Else
	The result is negative and is in 1's complement form in R.

**Example 1 :: 6-2**
 1's complement of 2 = 1101
  6 :: 0110
 -2 :: 1101
   1  0011  -- take the 1 and add it to 0011 => end-around carry.
	  1
    0100   = +4 

Since there is a carry, it is added back to the result. The result is positive.

**Example :: 3-5**
1's complement of 5 : 1010
 3 :: 0011
 -5:: 1010
    1101   = -2 

Since there is no carry, the result is negative.

### Subtraction using addition :: 2's Complement
- To compute A-B
- compute the 2's complement of B(say, $B_{2}$)
- compute R = A + $B_{2}$
- if a carry is obtained after addition is '1' :
	ignore the carry
	the result is a positive number.
- Else 
	the result is negative and is in 2's complement form in R.

With this, we know that if we have an adder, we can do subtraction also. So there is no need to explicitly learn subtracter circuits.  

# How to Detect Overflow ? 

- When the sign of two numbers are different, adding them can never result in overflow.
- When can overflow occur?
	- sign of two numbers are the same
	- sign of the sum is different is different from sign of either of the numbers.
- Other methods also exist :
	- Carry in and carry out of the most significant addition stage are different.