
## Definition : 
Systematic way to represent and manipulate numbers.

*Weighted Number systems* :  decimal, binary etc. (Place value and face value are not equal)

*non-weighted Number systems* : Roman ,Gray Code etc. (Place value and face value are equal)

*Sexagesimal Number System*:
Base or radix is 60 . (0-59)
Same way in which we count seconds and minutes.

*Decimal Number Systems*:
Base or radix is 10.
Every digit position has a weight that is a power of 10.

*Binary Number System*:
base or radix is 2.
Every digit position has a weight that is a power of 2.
Binary digits are called Bits.

## Generalization :

*Radix(r)* : number of distinct digits.
Every digit position has a weight that is power of r(say $r^k$ )
K>=0 for integer part, k<0 for decimal part.

## Decimal to Binary Conversion

- Consider the integer and decimal parts seperately.
- For the integer part:
		Repeatedly multiply by 2 , and go on accumulating the remainders until the number becomes zero.
		Arrange the remainders in reverse order.
- For the Fractional part:
		Repeatedly multiply the given fraction by 2.
		If the integer part is 1, chop it off.
		Arrange the integer parts in the order they are obtained.


 2 | 239                  Put them in the reverse order 
 2 | 119 --- 1          $(239)_{10}$ = $(11101111)_{2}$
 2 | 59   --- 1           
 2 | 29   --- 1
 2 | 14   --- 1
 2 | 7     --- 0
 2 | 3     --- 1
 2 | 1     --- 1
 2 | 0     --- 1


 Now lets try to find the binary representation of 0.634:
$.634 * 2 = 1.268$    //  cut off 1
$.268 * 2 = 0.536$ 
$.536 * 2 = 1.072$     
$.072 * 2 = 0.144$ 
$.144 * 2 = 0.288$     
... and so on$$(0.634)_{10} = (0.10100....)_{2}$$
