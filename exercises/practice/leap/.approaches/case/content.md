# Using case

```crystal
module Year
  def self.leap?(year : Number) : Bool
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

The `Year.leap?` method takes a `Number` as an argument and returns a `Bool`.
Then a is a [`case`][case] expression defined with the `case` keyword, it takes the `year` argument as its subject.
The `case` expression has four branches, the first three are `when` expressions.
Each `when` has a the method call for the method `divisible_by?`, which can be seen by the dot (`.`) before the method name, this is known as implicit invocation.
Each method is feed an argument, which is the number to check if the year is divisible by.
When the condition for each `when` expression is executed, the method is called on the subject of the `case` expression, which is the `year` argument.
If the method returns `true` the branch is executed, otherwise the next branch is evaluated.

The `when` branches order is important, if not in the correct order the result will be wrong.
This is because the `case` expression will evaluate the branches in order and return the first one that matches.
In the _leap_ problem so if a year is divisible by 400, then it is **always** a leap year.
In the 2nd branch we know the input is not divisible by 400, so then we can check if it is divisible by 100, if it is then it is not a leap year.
In the 3rd branch we know the input is not divisible by 400 or 100, so then we can check if it is divisible by 4, if it is then it is a leap year.
Say we had the 2nd branch as the first branch, then the input would be checked if it is divisible by 100 first, that would mean we would never check if it is divisible by 400, so the result would be wrong.

The last branch is the `else` branch, it is executed if none of the other branches are executed.
The `case` expression has implicit return, so the result of the executed branch is returned.
Then the method returns the result of the `case` expression, also by implicit return.

[case]: https://crystal-lang.org/reference/syntax_and_semantics/case.html
