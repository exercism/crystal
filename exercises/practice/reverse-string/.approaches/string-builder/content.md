# Using String::Builder

```crystal
module ReverseString
  def self.reverse(input : String) : String
    String.build(input.size) do |builder|
      (0...input.size).reverse_each do |i|
        builder << input[i]
      end
    end
  end
end
```

The method takes a `String` as an argument and returns a `String`.
The constructor, [`String.build`][string-build], takes the size of the string as an argument.
The `String.build` method is from the [`String::Builder` class][string-builder].
The `String::Builder` allows writing to a buffer in memory.

The constructor is given the size of the string to be reversed.
This is due to the fact that we already know the size of the string.
This is more efficient than using the default size of 16 and then resizing the string later.

A [`Range`][range] is created from `0` to the size of the string (exclusive).
The [`reverse_each`][reverse-each] method iterates over the range in reverse order.
So the last index of the string is the first value given to the block.
For each index, the character at that index is appended to the string builder.

The `String.build` method is what is implicitly returned from the method.

[string-builder]: https://crystal-lang.org/api/String/Builder.html
[string-build]: https://crystal-lang.org/api/String.html#build%28capacity%3D64%2C%26%29%3Aself-class-method
[range]: https://crystal-lang.org/api/Range.html
[reverse-each]: https://crystal-lang.org/api/Range.html#reverse_each%28%26%29%3ANil-instance-method
