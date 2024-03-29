# Numbers

Crystal has a type, `Number`, which is the base type for all numeric types.
There are two main sub-types inside the Number type: [`Int`][int] and [`Float`][float].

`Int` is short for integer and represents whole numbers.
`Int` can be both negative and positive, with no decimal point.

```crystal
1.class
# => Int32

-1.class
# => Int32
```

`Float` represents numbers with a decimal point.
`Float`s can be both negative and positive.

```crystal
10.5.class
# => Float64
```

## Converting between `Int` and `Float`

Using the 'to_i' and' to_f' methods, you can convert between `Int` and `Float`.
The number is rounded down when converting from `Float` to `Int`.

```crystal
1.to_f
# => 1.0

1.0.to_i
# => 1

1.9.to_i
# => 1
```

## Arithmetic operators

You can use the [basic arithmetic operators][math] on `Int` and `Float`.
The operators are `+`, `-`, `*`, `/`, and `%`.
When using these operators, you can mix and match `Int` and `Float`.

### Addition & Subtraction & Multiplication

The `+` operator is used for addition, the `-` operator is used for subtraction, and the `*` operator is used for multiplication.

| Operator | Example        |
| -------- | -------------- |
| `+`      | `4 + 6 => 10`  |
| `-`      | `15 - 10 => 5` |
| `*`      | `2 * 3 => 6`   |

### Division

Division is used to divide numbers.
The `/` operator is used for division.
The result will always be a Float.

```crystal
4 / 2
# => 2.0

4.0 / 2
# => 2.0
```

~~~~exercism/caution
In some programming languages, when dividing by zero, the result will be an error.

In Crystal, when dividing by zero, the result is `Infinity` or `-Infinity`.
The only exception is dividing zero by zero, resulting in `NaN` (Not a Number).
`Infinity` and `NaN` are particular values in the `Float` type.

```crystal
1 / 0
# => Infinity

-1 / 0
# => -Infinity

0 / 0
# => NaN
```
~~~~

### Modulus

Modulus is used to get the remainder of a division.
The `%` operator is used for modulus.

```crystal
5 % 2
# => 1

5.0 % 2
# => 1.0

5 % 3
# => 2
```

~~~~exercism/caution
Dividing by zero when using modulo results in a DivisionByZeroError.
This is different from normal division.

```crystal
1 % 0
# Error: Unhandled exception: Division by 0 (DivisionByZeroError)
```
~~~~

## Rounding

The `round` method takes an optional argument: the number of decimal places to round to.
The default number of decimal places is 0.

```crystal
1.0.round
# => 1

1.5.round
# => 2

1.234.round(2)
# => 1.23
```

## Priority and parentheses

Crystal allows parentheses(`()`), which can be used to group expressions.
This is useful when you want to change the order of operations.

When using multiple arithmetic operators, the order of operations is the same as in mathematics, also known as [PEMDAS][pemdas].
It follows the order of parentheses(`()`), exponents(`**`), multiplication(`*`) and division(`/`), and addition(`+`) and subtraction(`-`).

```crystal
2 + 3 - 4 * 4
# => -11

(2 + 3 - 4) * 4
# => 4
```

[pemdas]: https://en.wikipedia.org/wiki/Order_of_operations
[math]: https://crystal-lang.org/reference/latest/tutorials/basics/30_math.html
[int]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/integers.html
[float]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/floats.html
