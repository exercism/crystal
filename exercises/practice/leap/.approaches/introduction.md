# Introduction

There are various ways to solve **leap**.
Crystal has a `leap_year?` built-in method in the `Time` module.
However, this method is disabled for this specific exercise because our intent is for you to practice Boolean logic.
Otherwise, the built-in `leap_year?` method should be used in idiomatic Crystal code.

## General guidance

The goal of this exercise is to use various boolean logic to respond to if a year is a leap year or not.
The most common solution is using some form of the [modulo operator (`%`)][modulo operator], which is an operator which returns the remainder of a division.

## Approach: Using a boolean-chain

Using a boolean-chain is a great way to create concise and performant code.
The `divisible_by?` method is the most exemplar way to check if a number is divisible by another number.
The built-in [`leap_year?`][leap-year] method is implemented using this approach with `divisible_by?` (as of Crystal 1.11).
`divisible_by?` offers a clear indication of what the method does and is easy to read.
Compared to using `number % 4 == 0` which is harder to read and understand.
Although `%` can get the remainder which `divisible_by?` can't.

```crystal
module Year
  def self.leap?(year : Number) : Bool
    year.divisible_by?(4) && (year.divisible_by?(400) || !year.divisible_by?(100))
  end
end
```

For more information, check the [boolean-chain approach][approach-boolean-chain].

## Approach: Using `case` 

Using `case` is a great way to create readable code, especially when you have multiple conditions.
In this approach we use the fact that we can implicitly invoke a method on a case's when expression.

```crystal
module Year
  def self.leap?(year)
    case year
    when .divisible_by? 400
      true
    when .divisible_by? 100
      false
    when .divisible_by? 4
      true
    else
      false
    end
  end
end
```

For more information, check the [case approach][approach-case].

## Approach: Using rules

Using rules is a great way to create reusable logic which makes so you can build things like block programming system and in general makes for an interesting solution.
This solution uses `Proc` to create a rule system.

```crystal
module Year
  RULES = [
    p_divisible_by?(4),
    p_or(
      p_negate(p_divisible_by?(100)),
      p_divisible_by?(400)),
  ]

  def self.leap?(year) : Bool
    RULES.map(&.call(year)).all?(&.itself)
  end

  def self.p_divisible_by?(num : Int32) : Proc(Int32, Bool)
    ->(year : Int32) { year.divisible_by?(num) }
  end

  def self.p_negate(test : Proc(A, Bool)) : Proc(A, Bool) forall A
    ->(input : A) { !test.call(input) }
  end

  def self.p_or(a : Proc(A, Bool), b : Proc(A, Bool)) : Proc(A, Bool) forall A
    ->(input : A) { a.call(input) || b.call(input) }
  end
end
```

For more information, check the [rules approach][approach-rules].

## Benchmark

For more information, check the [Performance article][article-performance].

[approach-divisible_by]: https://exercism.org/tracks/crystal/exercises/leap/approaches/boolean-chain
[approach-case]: https://exercism.org/tracks/crystal/exercises/leap/approaches/case
[approach-proc]: https://exercism.org/tracks/crystal/exercises/leap/approaches/rules
[article-performance]: https://exercism.org/tracks/crystal/exercises/leap/articles/performance
[leap-year]: https://crystal-lang.org/api/Time.html#leap_year%3F%28year%3AInt%29%3ABool-class-method
[modulo operator]: https://wikipedia.org/wiki/Modulo_operation
