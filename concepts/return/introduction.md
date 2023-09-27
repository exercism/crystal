# Return

In Crystal, the last expression in a method returns its value.
Although sometimes you need to return a value before the last expression.
For this, you can use the `return` keyword, which will return the value of the expression that follows it.
Code written after a `return` keyword will not be executed.

```crystal
def speed_limit(road_number)
    if road_number == 1
        return 50
        puts "This will not be executed"
    end
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
