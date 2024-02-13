# Data Driven

```crystal
module Raindrops
  DROPS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}
  def self.convert(number : Int)
    DROPS.join { |k, v| v if number.divisible_by?(k) }.presence || number.to_s
  end
end
```

Using a data-driven approach to create logic to solve the raindrops problem, makes the solution both concise and flexible.
If the rules change, it is as easy as to change the rules.
The solution starts by creating a `Hash` with the rules.
Then it uses [`Enumerable#join`][enumerable-join] used on the newly created `Hash`.
The `join` method will iterate over the `Hash` and join the values together as a `String`.
The `join` method takes a block, which feds the key and value of the `Hash`.
Then if the number is divisible by the key, it will return the value, otherwise, it will return `nil`.

The result of the `join` method is then fed to [`String#presence`][string-presence].
It will return the `String` if it is not empty, otherwise, it will return `nil`.
Then the [`||` operator][or-operator] is used to return the number as a `String` if the result is `nil`, otherwise it will return the result.

[enumerable-join]: https://crystal-lang.org/api/Enumerable.html#join%28separator%3D%22%22%2C%26%3AT-%3E%29-instance-method
[string-presence]: https://crystal-lang.org/api/String.html#presence%3Aself%7CNil-instance-method
[or-operator]: https://crystal-lang.org/reference/syntax_and_semantics/or.html
