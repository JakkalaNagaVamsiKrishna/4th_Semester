## Basic Concept 
- Extra bits are added to the data bits that we want to represent to get *codewords*.
- Codewords are divided into two categories : valid codewords and invalid codewords.
- A bit error changes a *valid codeword* to an *invalid codeword*.

`Distance` : dist($C_{i},C_{j}$) denotes the number of bit positions in which codewords differ.
EX. distance between codewords 01001 and 11100 is 3.

`For detecting k errors the distance between 2 valid codewords must be atleast (k+1).`
`For single error correction, the distance must be atleast 3.`

# Parity Code for Error Detection 
- The parity of a given binary word is defined by whether the number of 1's is odd or even.
	- Any odd number of bit errors can be detected.

# Hamming Code for single Error Correction
- A code with minimum distance of $2k+1$ can detect up to $k$ bit errors.
- Basic Principles of Hamming Code :
	- To each group of m info bits, k parity bits are added to form a $(m+k)$- bit code.
	- Each of the $(m+k)$ bit locations in a codeword is assigned a value.
		- 1 to  the MSB, 2 to the 2nd MSB, $\dots$ $(m+k)$ to the LSB.
	- k must satisfy the inequality   $$2^k \geq m + k + 1$$
	- The parity check bits are assigned position numbers that are of powers of 2.
	- Parity check bits are computed based on some well defined formula.

