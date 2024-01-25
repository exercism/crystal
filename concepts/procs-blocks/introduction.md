# Blocks & Procs

[Block][block] is a piece of code that can be passed to a method.
This is known as an [anonymous function or lambda][anonymous function] in other programming languages.
A method can convert a block to a [Proc][proc] which represents a block of code.

```crystal
def my_method(&block)
  1 + yield
end

my_method { 2 }
# => 3
```

Blocks and Procs are very commonly used in Crystal, for things like iteration and callbacks.
But also to create [DSLs (Domain Specific Languages)][dsl], some examples of DSLs are the web framework [Kemal][kemal] or the testing framework [Spec][spec] (which is what is used to test your Crystal solutions).

## Blocks

To create a method that can accept a block you need to add an ampersand(`&`) before the last argument.
This will convert the block to a Proc and assign it to the argument.
Then using `yield` will execute the block given to the method.

```crystal
def my_method(&block)
  1 + yield
end
```

To pass a block there are two ways, either using the `do ... end` keywords or using curly braces(`{}`).
The main difference between the two is precedence, the `do ... end` supports multi-line blocks while the curly braces(`{}`) does not.

```crystal
my_method do
  2
end
# => 3

my_method { 2 }
# => 3
```

## Yield

[`yield`][yield] is a keyword that executes the block given to the method.
That means that the block will never be executed if `yield` is not called.
It can also be given arguments which will be passed to the block.
There is no limit to the number of arguments that can be passed to the block.
To use the arguments in the block you use the `|x, y, ...|` syntax.
There x, y, ... are the names of the arguments.

```crystal
def my_method(&block)
  1 + yield 2
end

# With curly braces:

my_method { |x| x * 3 }
# => 7

# With do ... end:

my_method do |x|
  x * 3
end
# => 7
```

In the example above the block is given the argument `2` and the block multiplies it by `3` and returns `6`.
Then the method adds `1` to the result and returns `7`.

If the number of arguments given to `yield` is more than the number of arguments the block expects, an error will be raised.

```crystal
def my_method(&block)
  1 + yield
end

my_method { |x| x * 3 }
# Error: too many block parameters (given 1, expected maximum 0)
```

## Types of blocks

Blocks can be written explicitly or implicitly.
Implicit blocks are the most common and are the ones shown in the examples above.
You can even give the block different types of arguments and the compiler will infer the types and create a union type.

```crystal
def my_method(&block)
  yield "a"
  yield 1
end

my_method do |x|
  p typeof(x)
end

# output: (String | Int32)
```

When writing explicit blocks you can specify the types of the arguments and the return type.
This is done by the `Arg1Type, Arg2Type, ... -> ResultType` syntax.
There the arguments are separated by commas(`,`), and the result type is separated by `->`.

```crystal
def my_method(&block : Int32, Int32 -> Int32)
  1 + yield(2, 3)
end

my_method { |x, y| x * y }
# => 7
```

As with other explicit types so will the compiler enforce the types being what is expected.
If the block does not match the type given to the method an error will be raised.

## Procs

[`Proc`][procs] has a very strong connection to blocks.
The key difference is that a `Proc` is a type and a block is not.
A `Proc` represents a function pointer and can be passed around as a variable.

To define a `Proc` you use the proc literal `->(args) { ... }` syntax.
The arguments are separated by commas(`,`), and the block is separated by `{ ... }`.
To invoke a Proc you use the `call` method and pass the arguments to it.

```crystal
my_proc = ->(x, y) { x * y }
my_proc.call(2, 3)
# => 6
```

They can also be explicitly typed like blocks.

```crystal
my_proc = ->(x : Int32, y : Int32) : Int32 { x * y }
my_proc.call(2, 3)
# => 6
```

## Capturing blocks

[Capturing blocks][capturing-blocks] is a way to create a `Proc` from a block.
This is done by using the `&` operator before the last argument of a method.
That will convert the block to a `Proc` and assign it to the argument. 

```crystal
def my_method(&block)
  block.call
end

my_method { 1 + 2 }
# => 3
```

### Passing procs to methods

Procs can be passed to methods that expect a block.
This can be handy when wanting to be able to pass different blocks based on some condition.

```crystal
def my_method(&block)
  yield 5
end

my_proc = -> (x) { x * 2 }
my_method(&my_proc)
# => 10
```

### Declaring the type of variables

When declaring a variable you can use the `: Type` syntax to declare the type of the variable.
For procs, you use the `Proc((ArgType, ...), ResultType)` syntax.
The last type will always be the return type and the rest will be the argument types.
Meaning if there is only one type it will be the return type and the proc will take no arguments.

```crystal
my_proc : Proc(Int32, Int32, Int32) = ->(x, y) { x * y }
other_proc : Proc(Int32) = -> { 1 }
```

[proc]: https://crystal-lang.org/reference/syntax_and_semantics/literals/proc.html
[block]: https://crystal-lang.org/reference/syntax_and_semantics/blocks_and_procs.html
[yield]: https://crystal-lang.org/reference/syntax_and_semantics/blocks_and_procs.html#yield-arguments
[capturing-blocks]: https://crystal-lang.org/reference/syntax_and_semantics/capturing_blocks.html
[kemal]: https://kemalcr.com/
[spec]: https://crystal-lang.org/reference/guides/testing.html
[dsl]: https://en.wikipedia.org/wiki/Domain-specific_language
[anonymous function]: https://en.wikipedia.org/wiki/Anonymous_function
