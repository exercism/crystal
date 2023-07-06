# String methods

String has a number of methods that can be used to manipulate strings.  
These methods are called on the string itself, and are often chained together to perform multiple operations on a string.

Following is a list of some of the most common methods, for a full list of methods, see the [String API documentation][string-api].

## String#upcase & String#downcase

The [`upcase`][upcase] method returns a new string with all the characters converted to uppercase.

```crystal
"hello".upcase
# => "HELLO"
```

The [`downcase`][downcase] method returns a new string with all the characters converted to lowercase.

```crystal
"HELLO".downcase
# => "hello"
```

## String#capitalize & String#camelcase & String#underscore & String#titleize

There are a number of methods that can do more specific case conversions.
That can be useful when you want to convert a string to a specific format.
Here is a list of some of the most common methods:

| Method                            | Description                                                                                                        | Example                                              |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------- |
| [`String#capitalize`][capitalize] | Converts the first letter to uppercase and the rest to lower case                                                  | `"hEllO" # => "Hello"`                               |
| [`String#camelcase`][camel-case] | Converts underscore to camelcase                                                                                  | `"eiffel_tower" # => "EiffelTower"`                  |
| `String#camelcase(lower: true)`   | Same as String#camelcase but leaves the first character lower cased                                                | `"empire_state_building" # => "empireStateBuilding"` |
| [`String#underscore`][underscore] | Converts all characters to downcase and places an underscore where between a downcase letter and an upcased letter | `"PartyInTheUSA" # => "party_in_the_usa"`            |
| [`String#titleize`][titleize]     | Capitalizes the first letter for each word and downcase the rest                                                   | `"the great gatsBY" # => "The Great Gatsby"`         |

## String#sub & String#gsub

Crystal has methods for replacing parts of a string.
These are known as [`sub`][sub] (_substitution_) and [`gsub`][gsub] (_global substitution_).

These methods can take a string, char or regex as the first argument, and a string or char as the second argument.
The first argument is the part of the string that will be replaced, and the second argument is the replacement.
Chars and regex will be explained at later concepts.

The `sub` method will replace the first occurrence of the first argument with the second argument.

```crystal
"hello".sub("l", "r")
# => "herlo"
```

The `gsub` method works the same as sub but will replace all occurrences of the first argument with the second argument.

```crystal
"hello".gsub("l", "r")
# => "herro"
```

## String#chomp & String#strip

Chomp and strip are methods that can be used to remove unwanted characters from a string.

The [`chomp`][chomp] method will be default remove the last `\r`, `\n` or `\r\n` characters from a string.
If the method is called with an argument, it will remove the given value from the end of the string.

```crystal
"hello\n".chomp
# => "hello"

"hello".chomp("llo")
# => "he"
```

The [`strip`][strip] method will by default remove all whitespace from the beginning and end of a string.
If the method is called with an argument, it will remove that argument from the beginning and end of the string.

```crystal
" hello ".strip
# => "hello"
```

## String#reverse

To reverse a string, you can use the [`reverse`][reverse] method.
This method will return a new string with the characters in reverse order.

```crystal
"hello".reverse
# => "olleh"
```

## String#index

The [`index`][index] method can be used to find the index of a character in a string.
The `index` method takes a string, char or regex as an argument.
And can take an optional second argument to specify the index to start searching from.
The `index` method will return the index of the first occurrence of the argument.

```crystal
"hello".index("l")
# => 2

"hello".index("l", 3)
# => 3
```

## String#delete_at

To remove a character from a string, you can use the [`delete_at`][delete_at] method.
The `delete_at` method takes an index as an argument and will remove the character at that index.

```crystal
"hello".delete_at(0)
# => "ello"

"hello".delete_at(3)
# => "helo"
```

## String#insert

The [`insert`][insert] method can be used to insert a string at a specific index.
The `insert` method takes an index as the first argument and a string as the second argument.
The `insert` method will return a new string with the second argument inserted at the index.

```crystal
"hello".insert(0, "h")
# => "hhello"

"hello".insert(3, "l")
# => "helllo"
```

[string-api]: https://crystal-lang.org/api/latest/String.html
[upcase]: https://crystal-lang.org/api/latest/String.html#upcase%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[downcase]: https://crystal-lang.org/api/latest/String.html#downcase%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[camel-case]: https://crystal-lang.org/api/latest/String.html#capitalize(options=Unicode::CaseOptions::None)-instance-method
[underscore]: https://crystal-lang.org/api/latest/String.html#underscore%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[titleize]: https://crystal-lang.org/api/latest/String.html#titleize%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[capitalize]: https://crystal-lang.org/api/latest/String.html#capitalize%28options%3AUnicode%3A%3ACaseOptions%3D%3Anone%29%3AString-instance-method
[sub]: https://crystal-lang.org/api/latest/String.html#sub%28string%3AString%2Creplacement%29%3AString-instance-method
[gsub]: https://crystal-lang.org/api/latest/String.html#gsub%28string%3AString%2Creplacement%29%3AString-instance-method
[chomp]: https://crystal-lang.org/api/latest/String.html#chomp%28suffix%3AString%29%3AString-instance-method
[strip]: https://crystal-lang.org/api/latest/String.html#strip%28chars%3AString%29%3AString-instance-method
[reverse]: https://crystal-lang.org/api/latest/String.html#reverse%3AString-instance-method
[index]: https://crystal-lang.org/api/latest/String.html#index%28search%3AString%2Coffset%3D0%29-instance-method
[delete_at]: https://crystal-lang.org/api/latest/String.html#delete_at%28index%3AInt%29%3AString-instance-method
[insert]: https://crystal-lang.org/api/latest/String.html#insert%28index%3AInt%2Cother%3AString%29%3AString-instance-method
