# While and Until Loops

A loop is a control structure that allows code to be executed repeatedly based on a given condition.

## While Loops

A while loop is a control structure that allows code to be executed repeatedly based on a given condition.
The code within a while loop will continue to execute while the condition evaluates to truthy.
While loops are often used when the number of iterations is not known beforehand but can be used in any situation where a loop is needed.

The condition is evaluated before the code within the loop is executed, which means that if the condition is false the code within the loop will never be executed.

```crystal
i = 0
while i < 3
  puts i
  i += 1
end

# Output:
# 0
# 1
# 2
```

When wanting to iterate over a string, you can loop over the length of the string.

```crystal
str = "Hello"
i = 0
while i < str.size
  puts str[i]
  i += 1
end

# Output:
# H
# e
# l
# l
# o
```

## Until Loops

Until loops work the same as while loops, except that the code within the loop will continue to execute until the condition evaluates to truthy.
It is the same as the difference between `if` and `unless`.

```crystal
i = 0
until i == 3
  puts i
  i += 1
end
```

### Infinite loops

A common error with while loops is getting into an "infinite" loop: a loop that never exits.
The condition of an infinite loop _never_ evaluates to a falsey value.
This is often due to programmer error; for example, forgetting to increment the loop variable.
But sometimes an infinite loop is the clearest way to implement the logic of the program.
Or it is truly necessary to loop forever; for example, an HTTP server waits for an incoming connection, handles it, then waits for the next connection.

## Break

The `break` keyword can be used to exit a loop early.
This can be convenient when you want to exit a loop early under certain conditions.

```crystal
i = 0
while i <= 3
  puts i
  i += 1
  if i == 2
    break
  end
end

# Output:
# 0
# 1
```

## Next

The `next` keyword can be used to skip to the next iteration of a loop.
This can be convenient when you want to skip certain iterations of a loop.

```crystal
i = 0
while i <= 3
  i += 1
  if i == 2
    next
  end
  puts i
end

# Output:
# 1
# 3
```

## Types under looping

The type of the variable can be different under looping.
In the following example, the type of `a` is `Int32 | String` because it can be `Int32` or `String` under the first part of the loop.
The variable `a` will only carry the type `Int32 | String` under the first part of the loop, since when the loop starts it holds `Int32` and under the 2nd iteration it holds `String`.
Exactly what this multiple type system is, will be explained in later concepts.
But since we are sure that under the 2nd part of the loop it will only hold `String`, the type of `a` is `String` under the 2nd part of the loop.
It will never hold `Int32` and `String` at the same time in runtime.

```crystal
i = 0
a = 4
while i < 3
  p typeof(a)
  # => Int32 | String
  a = "4"
  p typeof(a)
  # => String
  i += 1
end
```

## Return

In Crystal, the last expression in a method returns its value.
Although sometimes you need to return a value before the last expression.
For this, you can use the `return` keyword, which will return the value of the expression that follows it.
Code written after a `return` keyword will not be executed.

```crystal
def speed_limit(road_number)
    if road_number == 1
        return 50
        puts "This will not be executed"
    elsif road_number == 2
        return 80
        puts "This will not be executed"
    end
    100
end

p speed_limit(1) # => 50
p speed_limit(2) # => 80
p speed_limit(3) # => 100
```

~~~~exercism/note
The `return` keyword should be omitted when the last expression in a method is the value that should be returned.
~~~~

[while]: https://crystal-lang.org/reference/latest/syntax_and_semantics/while.html
[until]: https://crystal-lang.org/reference/latest/syntax_and_semantics/until.html
[break]: https://crystal-lang.org/reference/latest/syntax_and_semantics/break.html
[next]: https://crystal-lang.org/reference/latest/syntax_and_semantics/next.html
