# Introduction

There are various ways to solve **raindrops**.
Raindrops is a simple problem, but it can be solved in many different ways.
Its focus is on checking for divisibility and building a string based on conditions.

## General guidance

To solve this exercise is some form of conditionals required.

## Approach: Using conditionals

Using conditionals to build a string using if expressions and the ternary operator.

```crystal
module Raindrops
  def self.convert(count : Int32) : String
    result = ""
    result += "Pling" if count.divisible_by?(3)
    result += "Plang" if count.divisible_by?(5)
    result += "Plong" if count.divisible_by?(7)
    result.blank? ? count.to_s : result
  end
end
```

For more information, check the [conditionals approach][approach-conditionals].

## Approach: Using a data-driven approach

Using rules to create logic to create a `String` for the result.
This solution is very concise since it only uses only one if statement, it does this by using looping and using the `||` operator.

```crystal
module Raindrops
  DROPS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}
  def self.convert(number : Int)
    DROPS.join { |k, v| v if number.divisible_by?(k) }.presence || number.to_s
  end
end
```

For more information, check the [data-driven approach][approach-data-driven].

## Benchmark

For more information, check the [Performance article][article-performance].

[approach-data-driven]: https://exercism.org/tracks/crystal/exercises/raindrops/approaches/data-driven
[approach-conditionals]: https://exercism.org/tracks/crystal/exercises/raindrops/approaches/conditionals
[article-performance]: https://exercism.org/tracks/crystal/exercises/raindrops/articles/performance
