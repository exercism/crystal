# Using Boolean Chain

```crystal
module Year
  def self.leap?(year : Number) : Bool
    year.divisible_by?(4) && (year.divisible_by?(400) || !year.divisible_by?(100))
  end
end
```

The method takes a `Number` as an argument and returns a `Bool`.
This method first checks if the number is divisible by 4 using the [`divisible_by?`][divisible_by] method.
If the number is divisible by 4 it returns `true` otherwise `false`.

Then we repeat the `divisible_by?` method call with with 400 and 100.
But the result when dividing by 100 is inverted using the `!` operator.
Finally, we evaluate the result of the division by 400 using the [`||` operator][or], the logical OR operator.
If one of the two is true the result is true.

After those checks, the two resulting Boolean values are combined with the [`&&` operator][and], the logical AND operator.
If both are true the result is true, otherwise false.
Then the result is returned.

This solution is also possible to be solved using the `%` (modulus) operator, but as we are only interested in knowing if a number is divisible by another number, the `divisible_by?` method is more exemplar.

[divisible_by]: https://crystal-lang.org/api/Int.html#divisible_by%3F%28num%29%3ABool-instance-method
[and]: https://crystal-lang.org/reference/syntax_and_semantics/and.html
[or]: https://crystal-lang.org/reference/syntax_and_semantics/or.html
