# Conditionals

Crystal has what are known as control expressions, these are used to control the way the program will run and they take a truthy or falsey value.
There are operators that can be used to create truthy or falsey values, these are known as [equality and comparison operators][equality-and-comparison].

There are two main control expressions that are used to control which code will run and which will not.
Also known as which given branch will run.

Those two are: `if` and the `unless` expression.

## Comparison operators

Comparison operators are used to compare values and return a `true` or `false` value.
These operators require two values to be compared of the same type.
If the values are not of the same type then the compiler will throw an error.
Here is a list of the comparison operators and an example of when they give a `true` value:

| Method | Description           | Example |
| ------ | --------------------- | ------- |
| <      | less than             | 5 < 4   |
| <=     | less than or equal    | 4 <= 4  |
| >      | greater than          | 3 > 1   |
| >=     | greater than or equal | 2 >= 2  |

## Equality operators

Equality operators are similar to comparison operators but they are used to check if two values are equal or not equal.

The `==` operator is used to check if two values are equal, and that includes checking the type of the value.
If the values are the same then it will return `true` otherwise it will return `false`.
The `==` operator can compare any type of value with any other type of value.
The `!=` works the same way but it will return `true` if the values are not equal and `false` if they are equal.

## Spaceship operator

The spaceship operator is a special comparison operator and has got its name because of the way it looks.
It is special in the sense that it doesn't return a truthy or falsey value but it returns a number.
It is written as `<=>` and it is used to compare 2 values.
It will return `1` if the left value is greater than the right value, `-1` if the left value is less than the right value, and `0` if the values are equal.

```crystal
1 <=> 2 # => -1
2 <=> 2 # => 0
3 <=> 2 # => 1
```

## If statement

The [`if`][if] statement is used to check if a given condition is truthy or falsey.
If the condition is truthy then the code inside the if statement will run.
An `if` statement ends with the `end` keyword.

```crystal
if 1 == 1
  puts "1 is equal to 1"
end
# => 1 is equal to 1

if 1 > 2
  puts "1 is greater than 2"
end
# => no output
```

## Unless statement

The [`unless`][unless] statement works very similarly to the `if` statement but it will run the code inside the `unless` statement if the condition is falsey.

```crystal
unless 1 == 1
  puts "1 is not equal to 1"
end
# => no output

unless 1 > 2
  puts "1 is not greater than 2"
end
# => 1 is not greater than 2
```

## Else statement

The `else` statement can be used in conjunction with the `if` and `unless` statements.
The `else` statement will be executed if the `if` branch or the `unless` branch is not executed.

```crystal
if 1 == 1
  puts "1 is equal to 1"
else
  puts "1 is not equal to 1"
end
# => 1 is equal to 1

unless 1 < 2
  puts "1 is not greater than 2"
else
  puts "1 is greater than 2"
end
# => 1 is greater than 2
```

## "Cascading-if" statements

The `elsif` statement can be used in conjunction with the if statement.
The `elsif` statement will be executed if the if branch is not executed and the condition of the elsif statement is truthy.
Elsif statements can be chained together and the first truthy condition will be executed.
There can also be an else statement at the end of the if statement which will run if non of the earlier statement has been true.

```crystal
if 1 != 1
  puts "1 is not equal to 1"
elsif 1 > 2
  puts "1 is greater than 2"
else
  puts "1 is not equal to 1 and 1 is not greater than 2"
end
# => 1 is not equal to 1 and 1 is not greater than 2
```

## Ternary Operator

Crystal has a ternary operator which is a single line if-else statement: `condition ? expression_if_truthy : expression_if_falsey`

```crystal
1 == 1 ? puts("1 is equal to 1") : puts("1 is not equal to 1")
# => 1 is equal to 1
```

## if and unless as suffix

The if and unless statement can also be used as a [suffix][if-as-suffix], this is useful when you want to run a single line of code if a condition is true.
It is done by putting the if or unless statement after the code that you want to run.

```crystal
puts "1 is equal to 1" if 1 == 1
# => 1 is equal to 1

puts "1 is not equal to 1" unless 1 == 1
# => no output
```

## Types with conditionals

When assigning to different types then will the variable carry both of the types.
This is because the compiler doesn't know which branch will be executed.
This multiple assignment which is also known as a union will be explained in later concepts.
This can be seen in the following example:

```crystal
if 1 == 1
  a = 1
else
  a = "1"
end

typeof(a) # => Int32 | String
```

[if]: https://crystal-lang.org/reference/latest/syntax_and_semantics/if.html
[unless]: https://crystal-lang.org/reference/latest/syntax_and_semantics/unless.html
[equality-and-comparison]: https://crystal-lang.org/reference/latest/syntax_and_semantics/operators.html#equality-and-comparison
[if-as-suffix]: https://crystal-lang.org/reference/latest/syntax_and_semantics/as_a_suffix.html
