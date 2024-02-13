# Conditionals

```crystal
module Raindrops
  def self.convert(count : Int32) : String
    result = ""
    result += "Pling" if count.divisible_by?(3)
    result += "Plang" if count.divisible_by?(5)
    result += "Plong" if count.divisible_by?(7)
    result.empty? ? count.to_s : result
  end
end
```

This approach uses a series of [`if`'s suffix][if-suffix] statements to build a string.
It starts by creating an empty `String`.
Then based on if the number is divisible by 3, 5, or 7, it adds the appropriate string to the result.
The `String` added needs to be added in the correct order, otherwise the result would be reversed.
Finally, if the result is empty, it returns the number as a `String`, otherwise it returns the result.
It uses implicit return to return the result.

[if-suffix]: https://crystal-lang.org/reference/syntax_and_semantics/as_a_suffix.html
