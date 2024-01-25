# Using `Proc`s

```crystal
module Year
  RULES = [
    p_divisible_by?(4),
    p_or(
      p_negate(p_divisible_by?(100)),
      p_divisible_by?(400)),
  ]

  def self.leap?(year) : Bool
    RULES.map(&.call(year)).all?
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

This solution relies heavily on the usage of [`Proc`s][proc].
`Proc` is a datatype that represents a function pointer, it is recommended that you read the [concept:crystal/procs-blocks]() concept page before continuing.

The `RULES` constant is an array of function pointers (`Proc`) that represent the rules that must be satisfied for a year to be a leap year.
The first rule is that the year must be divisible by 4, the second rule is that the year must be divisible by 400 or not divisible by 100.
The 2nd rule includes a 3 level deep nested `Proc` that is created using the `p_or` and `p_negate` methods.
The `leap?` method takes a year and checks if all the rules are satisfied.
It does that by mapping all the function pointer in the `RULES` array and since all the elements are `Proc(Int32, Bool)`, then we can use the [`call`][call] method to call the function pointer with the year as an argument.
The result of the [`map`][map] method is an array of `Bool`s, since all the `Proc`s return a `Bool`.
Then we use the [`all?`][all] method to check if all the elements in the array are `true`.

The `p_divisible_by?` method takes a number and returns a `Proc` that takes a year and returns a `Bool` indicating if the year is divisible by the number.
The [`forall`][forall] annotation is used to indicate that the type `A` is generic and can be any type.
The `p_negate` method takes a `Proc` and returns a `Proc` that negates the result of the given `Proc`.
The `p_or` method takes two `Proc`s and returns a `Proc` that returns `true` if either of the given `Proc`s return `true`.

[proc]: https://crystal-lang.org/api/Proc.html
[call]: https://crystal-lang.org/api/Proc.html#call%28%2Aargs%3A%2AT%29%3AR-instance-method
[map]: https://crystal-lang.org/api/Enumerable.html#map%28%26%3AT-%3EU%29%3AArray%28U%29forallU-instance-method
[all]: https://crystal-lang.org/api/Enumerable.html#all%3F%3ABool-instance-method
[forall]: https://crystal-lang.org/reference/syntax_and_semantics/type_restrictions.html#free-variables
