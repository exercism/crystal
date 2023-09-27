# Number types

Crystal has a variety of different number types for different purposes.
For example, some types are faster but have a smaller range of possible values than other types.
Some that have a larger range of possible values but are slower.

In Crystal, there are both signed and unsigned integer types.
The signed integer types can be positive or negative.
The unsigned integer types can only be positive.

## Signed integers types

These are the [signed integer types][int] in Crystal:

| Type     | Size (bits) | Range                                                                                                       |
| -------- | ----------- | ----------------------------------------------------------------------------------------------------------- |
| `Int8`   | 8           | -128 to 127                                                                                                 |
| `Int16`  | 16          | -32_768 to 32_767                                                                                           |
| `Int32`  | 32          | -2_147_483_648 to 2_147_483_647                                                                             |
| `Int64`  | 64          | -9_223_372_036_854_775_808 to 9_223_372_036_854_775_807                                                     |
| `Int128` | 128         | -170_141_183_460_469_231_731_687_303_715_884_105_728 to 170_141_183_460_469_231_731_687_303_715_884_105_727 |

The smaller types use less memory and are faster than the larger types but have a smaller range of possible values.

Where you know that values will be within a certain range, it is best to use the smallest type possible to save memory and improve performance.

The default integer type is `Int32`.
To declare an integer with a specific type you can use the type name as a suffix, by adding `<number>_i<bit>`.

```crystal
1_i8.class
# => Int8
```

To convert between different integer types you can use the `to_i<bit>` method.
The `to_i` method converts to the default integer type, which is `Int32`.

```crystal
1_i8.to_i16.class
# => Int16

2_i16.to_i.class
# => Int32
```

## Unsigned integers types

These the [unsigned integer][uint] types in Crystal:

`UInt8`, `UInt16`, `UInt32`, `UInt64`, `UInt128`

The only difference to signed integers is that unsigned integers can only be positive.
To declare an unsigned integer with a specific type you can use the type name as a suffix, by adding `<number>_u<bit>`.
To convert between different unsigned integer types you can use the `to_u<bit>` method.
The `to_u` method converts to the default unsigned integer type, which is `UInt32`.

```crystal
1_u8.to_u16.class
# => UInt16
```

## Floating point types

These are the floating point types in Crystal:

| Type      | Size (bits) | Range                |
| --------- | ----------- | -------------------- |
| `Float32` | 32          | 1.2E-38 to 3.4E+38   |
| `Float64` | 64          | 2.3E-308 to 1.7E+308 |

There are two different [floating point types][float], one is more precise than the other.

The default floating point type is `Float64`.

To convert between different floating point types you can use the `to_f<bit>` method.
The `to_f` method converts to the default floating point type, which is `Float64`.

## Type after an operation

When you execute an operation between two numbers, the result will be of the type of the number with the highest precision.
Float is more precise than an integer and an integer is more precise than an unsigned integer.
Then `Float64` is more precise than Float32 and so on.

```crystal
(1_u8 + 2_u64).class
# => UInt64

(1_u8 + 2_i64).class
# => Int64

(1_u8 + 2.0_f64).class
# => Float64
```

## Dig Deeper: unsigned integers vs signed integers

~~~~exercism/advanced
Under the hood, what differentiates unsigned and signed integers is that signed integers use the first bit to store the sign.
The sign is either positive or negative.
For unsigned integers, the first bit is used to store the value.
So for a signed 32-bit integer is the max value 2^31 - 1.
For an unsigned 32-bit integer is the max value 2^32 - 1.

If you are interested in learning more about signedness you can read more about it on [Wikipedia](https://en.wikipedia.org/wiki/Signedness).
~~~~

[float]: https://crystal-lang.org/api/latest/Float.html
[int]: https://crystal-lang.org/api/latest/Int.html
[uint]: https://crystal-lang.org/api/latest/UInt32.html
