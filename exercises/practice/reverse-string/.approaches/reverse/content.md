# Reverse

```crystal
module ReverseString
  def self.reverse(input : String) : String
    input.reverse
  end
end
```

This is the simplest and most exemplary solution, using the built-in [`String#reverse`][reverse] method.
Internally, it uses a very optimized implementation, using a buffer and working directly on the string's bytes.
If curious, check the [source code][reverse-source].

[reverse-source]: https://github.com/crystal-lang/crystal/blob/fda656c71/src/string.cr#L4443
[reverse]: https://crystal-lang.org/api2/String.html#reverse%3AString-instance-method
