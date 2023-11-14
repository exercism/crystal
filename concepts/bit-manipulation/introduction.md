# Bit Manipulation

Crystal has bitwise operators for manipulating [`Int`][ints] at the binary level.

## Shift operators 

Crystal has [shift operators][shift] for shifting bits to the left (`<<`) or the right (`>>`).

### Shift left(`<<`)

The shift left operator (`<<`) shifts the bits to the left.
The value to shift is specified on the left side and the number of places to shift is on the right.

```crystal
0b0010 << 1
# => 0b0100

0b0010 << 2
# => 0b1000
```

If the number is negative, it will shift to the right instead.

```crystal
0b0010 << -1
# => 0b0001
```

### Shift right(`>>`)

The shift right operator (`>>`) shifts the bits to the right.
Like the shift left operator, the value to shift is specified on the left and number of places to shift is on the right.

```crystal
0b0100 >> 1
# => 0b0010

0b0100 >> 2
# => 0b0001
```

And similarly, the operator will shift to the left if the number is negative.

```crystal
0b0100 >> -1
# => 0b1000
```

## Binary operators

Crystal has 3 [binary operators][binary] (`&`, `|`, `^`) and a `~` operator for performing bitwise operations.

### Bitwise AND(`&`)

The binary AND operator (`&`) performs a bitwise AND on two values.
It compares each bit in the first value against the bit in the same position in the second value.
The resulting bit is set to 1 if both bits are 1.
Otherwise, it is set to 0.

```crystal
0b0011 & 0b1010
# => 0b0010
```

### Bitwise OR(`|`)

The binary OR operator (`|`) performs a bitwise OR on two values.
It also compares each bit in the first value against the bit in the same position in the second value.
If either bit is 1, the resulting bit is set 1.
Otherwise, it is set to 0.

```crystal
0b0011 | 0b1010
# => 0b1011
```

### Bitwise XOR(`^`)

The binary XOR operator (`^`) performs a bitwise XOR.
Like the bitwise AND and bitwise OR operators, it compares each bit from the first value against the bit in the same position in the second value.
If _only one_ of them is 1, the resulting bit is 1.
Otherwise, it is 0.

```crystal
0b0011 ^ 0b1010
# => 0b1001
```

### Bitwise NOT(`~`)

Lastly, the bitwise NOT operator (`~`) flips each of the value's bits. 
Unlike the other binary operators, this is a unary operator, operating on only on the value to the right.

```crystal
~0b1110_0010
# => 0b0001_1101
```

[ints]: https://crystal-lang.org/api/Int.html
[shift]: https://crystal-lang.org/reference/syntax_and_semantics/operators.html#shifts
[binary]: https://crystal-lang.org/reference/syntax_and_semantics/operators.html#binary
