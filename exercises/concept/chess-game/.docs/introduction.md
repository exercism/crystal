# Ranges

[Ranges][range] represent an interval between two values.
The most common types that support ranges are `Int`, `Char`, and `String`.
They can be used for many things, such as quickly creating a collection, slicing strings, checking if a value is in a range, and iteration.
They are created using the range operator `..` or `...` (inclusive and exclusive, respectively).

```crystal
1..5  # A range containing 1..5
1...5 # A range containing 1...5
```

The reason for having two range operators is to create ranges that are inclusive or exclusive of the end value, which can be useful when, for example, working with zero-based indexes.

Ranges can also be created using the `Range` initializer.

```crystal
Range.new(1, 5) # A range containing 1, 2, 3, 4, 5
```

~~~~exercism/note
When creating a range in Crystal using the range operators `..` or `...`, and wanting to call a method on the range, you need to wrap the range in parentheses.
This is because the otherwise will the method be called on the 2nd argument of the range operator.

```crystal
(1..5).size # => 5
1..5.size # => Error: undefined method 'size' for Int32
```
~~~~

## Getting substrings

When wanting to slice a string, you can use the range operator to get a sub-string.
That is, by creating a range with the start and end index of the sub-string.

```crystal
"Hello World"[0..4] # => "Hello"
"Hello World"[6..10] # => "World"
```

You can also use negative indexes to get the substring from the end of the string.

```crystal
"Hello World"[-5..-1] # => "World"
"Hello World"[6..-4] # => "Wo"
```

## Range methods

Ranges do have a set of methods that can be used to work with them.
For example, these methods can be used to get the sum of all the values in the range or check if the range includes a value.

| Method                  | Description                                                             | Example                         |
| ----------------------- | ----------------------------------------------------------------------- | ------------------------------- |
| [`sum`][sum]            | Returns the sum of all the values in the range                          | `(1..5).sum # => 15` |
| [`size`][size]          | Returns the size of the range                                           | `(1..5).size # => 5` |
| [`includes?`][indludes] | Returns `true` if the range includes the given value, otherwise `false` | `(1..5).includes?(3) # => true` |

## Endless & Beginningless ranges

A range can be endless and beginless.
The endless or beginless range has its start or end value as `nil`, but `nil` can be omitted when defining the range.

Using beginless and endless ranges is useful when you want to, for example, slice a string from the beginning or to the end.

```crystal
"Hello World"[0..] # => "Hello World"
"Hello World"[4..] # => "o World"
"Hello World"[..5] # => "Hello"
```

~~~~exercism/caution
If not used on a collection, the endless range can cause an endless sequence, if not used with caution.
~~~~

## Char ranges

Chars can be used in ranges and allow you to get an interval of chars between two chars.
For example, this can be handy when you want to get the alphabet.

```crystal
'a'..'z' # A range containing ['a', 'b', 'c', ..., 'z']
```

## String ranges

Strings can also be used in ranges, allowing one to get an interval of strings between two strings.
But its behavior is slightly different than that of `Char` when multiple characters are used in a string range.
Its behavior can become confusing when doing more complex string ranges, so use caution.

```crystal
("aa".."az") # A range containing ["aa", "ab", "ac", ..., "az"]
```

[range]: https://crystal-lang.org/api/latest/Range.html
[sum]: https://crystal-lang.org/api/latest/Range.html#sum%28initial%29-instance-method
[size]: https://crystal-lang.org/api/latest/Range.html#size-instance-method
[indludes]: https://crystal-lang.org/api/latest/Range.html#includes%3F%28value%29%3ABool-instance-method
