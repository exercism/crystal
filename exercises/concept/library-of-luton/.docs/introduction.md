# Char

`Char` is a data type in Crystal that represents a 32-bit [Unicode][unicode] code point.
Their size makes them memory efficient, and also gives them certain properties that Strings don't have.
They are created using single quotes (`'`) and do only allow for one Unicode code point to be placed inside.

```crystal
'a' # => 'a'
'a'.class # => Char
```

When working with Strings in Crystal it is quite common to work with Chars, since quite a few methods in the String class return Chars or takes Chars as arguments.
For example, the [`String#[]`][index] method returns a Char, and the [`String#chars`][chars] method returns a collection of Chars.

## Incrementing / Decrementing

Due to Char being a 32 Unicode point it supports incrementing and decrementing. For example, if you have `'a'` you can get `'b'` by adding one.

```crystal
'a' + 5
# => 'f'

'z' - 25
# => 'a'
```

There is also a method called [`Char#succ`][succ] which will return the next char in the Unicode table and [`Char#pred`][pred] which will return the previous char in the Unicode table.

```crystal
'a'.succ
# => 'b'

'z'.pred
# => 'y'
```

## concatenation

Since a Char is only meant to represent a single 32-bit Unicode point, concatenation of 2 Chars is not allowed.
Chars can only be concatenated with Strings.

```Crystal
'a' + "bc"
# => "abc"

'a' + 'b'
# => error: expected argument #1 to 'Char#+' to be Int or String, not Char
```

## Properties, methods

Crystal has a few methods that can be used to get information about a Char, like if it is a number or a letter, or if it is uppercase or lowercase.
Here is a list of some of the methods, for a full list see the [Char API][char-api]:

| Method                           | Description                                          |
| -------------------------------- | ---------------------------------------------------- |
| [`Char#number?`][number]         | Returns `true` if the Char is a number               |
| [`Char#letter?`][letter]         | Returns `true` if the Char is a letter               |
| [`Char#lowercase?`][lowercase]   | Returns `true` if the Char is lowercase              |
| [`Char#uppercase?`][uppercase]   | Returns `true` if the Char is uppercase              |
| [`Char#ascii?`][ascii]           | Returns `true` if the Char is an ASCII character      |
| [`Char#whitespace?`][whitespace] | Returns `true` if the Char is a whitespace character |

## Converting

### Converting between code points and Chars

Since Chars is a 32-bit Unicode point, you can convert between Chars and code points (Int).
This can be done using the [`Char#ord`][ord] method which will return the code point of the Char, or the [`Int#chr`][chr] method which will return the Char of the code point.

```crystal
'a'.ord
# => 97

97.chr
# => 'a'
```

### Converting between types

As with other data types, Chars have a few methods that can be used to convert between types.
The most common one is the `Char#to_s` method which will convert the Char to a String. There is also the `Char#to_i` method which will convert the Char to an Int, and the `Char#to_f` method which will convert the Char to a Float.

```crystal
'a'.to_s
# => "a"

'4'.to_i
# => 4

'a'.to_i
# => Error: Invalid integer: a (ArgumentError)
```

[char-api]: https://crystal-lang.org/api/latest/Char.html
[succ]: https://crystal-lang.org/api/latest/Char.html#succ%3AChar-instance-method
[pred]: https://crystal-lang.org/api/latest/Char.html#pred%3AChar-instance-method
[index]: https://crystal-lang.org/api/latest/String.html#%5B%5D%28index%3AInt%29%3AChar-instance-method
[chars]: https://crystal-lang.org/api/latest/String.html#chars%3AArray%28Char%29-instance-method
[ord]: https://crystal-lang.org/api/latest/Char.html#ord%3AInt32-instance-method
[chr]: https://crystal-lang.org/api/latest/Int.html#chr%3AChar-instance-method
[number]: https://crystal-lang.org/api/latest/Char.html#number%3F%3ABool-instance-method
[letter]: https://crystal-lang.org/api/latest/Char.html#letter%3F%3ABool-instance-method
[lowercase]: https://crystal-lang.org/api/latest/Char.html#lowercase%3F%3ABool-instance-method
[uppercase]: https://crystal-lang.org/api/latest/Char.html#uppercase%3F%3ABool-instance-method
[ascii]: https://crystal-lang.org/api/latest/Char.html#ascii%3F%3ABool-instance-method
[unicode]: https://en.wikipedia.org/wiki/Unicode
[whitespace]: https://crystal-lang.org/api/latest/Char.html#whitespace%3F%3ABool-instance-method
