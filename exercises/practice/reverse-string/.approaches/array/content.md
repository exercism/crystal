# Using an array

```crystal
module ReverseString
  def self.reverse(input : String) : String
    result = Array(Char).new(input.size)
    input.each_char do |char|
      result.unshift(char)
    end
    result.join
  end
end
```

The method takes a `String` as an argument and returns a `String`.
An empty array stores the reversed string which stores [`Char`][char].
The reason for using `Char` instead of `String` is because `Char` is lighter than `String`, and we only store one character at a time.
The Array is given the size of the string to be reversed, this makes the array doesn't have to be resized later which is more efficient.

The [`each_char`][each-char] method iterates over each character in the string.
For each character so are they unshifted into the array.
The [`unshift`][unshift] method adds the character to the beginning of the array.
This means the first character in the string will be the last character in the array.

The [`join`][join] method converts the array back to a string.

[char]: https://crystal-lang.org/api/Char.html
[each-char]: https://crystal-lang.org/api/String.html#each_char%28%26%29%3ANil-instance-method
[unshift]: https://crystal-lang.org/api/Array.html#unshift%28object%3AT%29%3Aself-instance-method
[join]: https://crystal-lang.org/api/Indexable.html#join%28separator%3AString%7CChar%7CNumber%3D%22%22%29%3AString-instance-method
