# Exception

In the ideal world, everything works perfectly.
But in the real world, things can go wrong, and how we handle these situations matters to ensure that our software is robust and reliable.
Exceptions are a crucial concept in programming that allows us to handle errors and unexpected situations gracefully.

Raising an error, if not handled, halts the program and throws an error message.
In most cases, you don't want your program to halt when an error occurs, instead you want to handle the error and continue running the program.

## Raising an exception

In Crystal, exceptions are raised using the `raise` keyword and can either be given a `String` or an `Exception` object.
If unhandled, the program will halt and print the error message.

```crystal
raise "This is an error"
```

There are several built-in exceptions in Crystal, like `ArgumentError`, `IndexError`, `KeyError`, `IOError`, `SystemCallError`, `TypeError`, `ZeroDivisionError` and many more.
These require you to pass a message to the exception.

```crystal
raise ArgumentError.new("This is an argument error")
```

## [Handling exceptions][exception-handling]

We wouldn't want our program to crash when an exception is raised.
Therefore, when we know a piece of code is error prone, we can wrap it in a `begin` block and rescue the exception with a `rescue` block.
The `begin` block marks the beginning of the code that might raise an exception, and the `rescue` block handles the exception.

```crystal
begin
 raise "This is an error"
rescue
 puts "An error occurred!"
end
```

The `rescue` block can also be specified with a variable to get the exception object.

```crystal
begin
 raise "This is an error"
rescue ex
 puts "An error occurred: #{ex.message}"
end
```

The `rescue` block can also be specified with a specific exception type only to catch that exception.

```crystal
begin
 raise ArgumentError.new("This is an argument error")
rescue ArgumentError
 puts "An argument error occurred!"
end

# or

begin
 raise ArgumentError.new("This is an argument error")
rescue ex : ArgumentError
 puts "An argument error occurred: #{ex.message}"
end
```

Multiple `rescue` blocks can be used to handle different types of exceptions.
In the example below, the first `rescue` block will catch an `ArgumentError`, and the second `rescue` block will catch any other exception.

```crystal
begin
 raise ArgumentError.new("This is an argument error")
rescue ArgumentError
 puts "An argument error occurred!"
rescue
 puts "An error occurred!"
end
```

The `begin` block can also have an `else` block, which is executed if no exception is raised.

```crystal
begin
 puts "No error occurred"
rescue
 puts "An error occurred!"
else
 puts "No error occurred"
end
```

Lastly, there is an `ensure` block that is always executed, regardless of whether an exception was raised.

```crystal
begin
 raise "This is an error"
rescue
 puts "An error occurred!"
ensure
 puts "This is always executed"
end
```

## Method convention

Some methods have two versions, one with `!` and the other without.
This can mean two different things.
One is that the method mutates the object, and the other is that the method can raise an exception.

But there is also another convention around ending a method with `?` mentioned in the boolean concept.
Some methods raise an exception by default but also have a version ending with `?` which returns `nil` instead of raising an exception.

This is ideal when you want to avoid an error being raised. 
This can benefit performance since it doesn't have to create a stacktrace and, if set up correctly, could make the code safer.

## Custom exceptions

You can also create your own exceptions by inheriting from the [`Exception`][exception] class.
In doing so, you can optionally override the `initialize` method to set the exception message.
This can be done by assigning an instance variable named `@message` with the message.

```crystal
class MyException < Exception
 def initialize
   @message = "This is my exception"
 end
end

raise MyException.new
```

[exception-handling]: https://crystal-lang.org/reference/syntax_and_semantics/exception_handling.html
[exception]: https://crystal-lang.org/api/Exception.html
