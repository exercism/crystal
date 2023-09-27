# Union types

Crystal allows for a variable to consist of multiple types.
This is called a [union type][union-type].
In Crystal it is quite common for a union type to be inferred by the compiler.

~~~~exercism/note
A union type, even if it consists of multiple types, is still a single type at runtime.
Meaning a union type is built of String and Int32 so it will not be both at the same time.
Instead, it will be either a String or an Int32.
~~~~

A union type is declared by separating the types with a pipe (`|`).
They are often placed in parenthesis, but it is not required.
The most common union type is `(T | Nil)` where `T` is a type, which can occur in methods that can return `Nil`.
This is also known as a variable being **nilable**.

```crystal
a : String = "Hello"
a = nil # Error: type must be String, not (String | Nil)

a : (String | Nil) = "Hello"
a = nil
```

It is not limited to just 2 types, but can be as many as you want.

```crystal
a : (String | Int32 | Nil | Float64) = "Hello"
a = 1
a = nil
a = 1.0
```

## `typeof` vs `Object#class`

There are 2 ways to get the type of a variable.
Either by using [`typeof`][typeof] or by using [`Object#class`][Object#class].
The difference between them is that `typeof` will return a variable's type at compile time, while `Object#class` will return the type at runtime.
Meaning if you want to for example see if a variable is a union type, then `Object#class` will not be able to tell you that as it will only return the type at runtime, which is a single type.

```crystal
a : (String | Int32) = "Hello"
typeof(a) # => (String | Int32)
a.class # => String
```

## Operations on union types

As a union type is a single type at runtime, all the normal operations work on it.
But when compiling the code the compiler will not know which type it is.
Thereby the code has to be setup in such a way that it can only be one of the types when wanting to use the type-specific operations.

```crystal
a : (String | Int32) = "Hello"
a.downcase # Error: undefined method 'downcase' for (String | Int32)
```

Crystal does have a special method for union types: the `is_a?` method, which takes a type as an argument and returns a boolean.
The `nil?` method is a shortcut for `is_a?(Nil)`.
Putting the `is_a?` method in an control expression will make the compiler know which type it is, and thereby guarantee that it is that type.
And for an else branch it will be guaranteed that it is not that type.

```crystal
a : (String | Int32) = "Hello"
if a.is_a?(String)
  typeof(a) # => String
  a.downcase # => "hello"
end
```

This `is_a?` is not limited to having just a single type as an argument, but can have a union type as an argument.
And can also be combined with `&&` to allow for multiple types.

~~~~exercism/note
The `is_a?` method when using it in conjunction with a control expression can't be an instance variable or class variable.
Instead these have to be assigned to a local variable first.
~~~~

## as

One way of making a union type into a single type is by making it so that a branch can only be entered if the type is a specific type.
Another approach is to use the [`as`][as] method.
This will make an union type into a single type by doing a runtime check.
If the type is not the expected type, it will raise an exception.

```crystal
a : String | Int32 = "Hello"
a.as(String).downcase # => "hello"

a.as(Int32) # Error: can't cast String to Int32
```

~~~~exercism/caution
This approach is only meant for when you are sure that the type is the expected type or if you want to raise an exception when it is not.

Using this approach with an improper setup can lead to unexpected behavior.
~~~~

## as?

[`as?`][as?] works very similarly to `as`, but instead of raising an exception if the type is not the expected type, it will return `nil`.
This means that it will return a union type of the expected type and `Nil`.

```crystal
a : (String | Int32) = "Hello"
a.as?(String).downcase # => "hello"

a.as?(Int32) # => nil
```

## Nilable shorthand

Nilable means that a variable can be either a type or `Nil`.
This can be written as `(T | Nil)`.
But since Nilable types are rather common, there is a shorthand for it: `T?`.

```crystal
a : (String | Nil) = "Hello"
a = nil

a : String? = "Hello"
a = nil
```

## Inferring union types

The compiler will infer a union type if it is not sure which type it is.
For example, in the following code the compiler will not know which type `a` is since it can be either a `String` or an `Int32`.

```crystal
if true
  a = 1
else
  a = "Hello"
end

p typeof(a) # => (Int32 | String)
```

This inference happens automatically, and there are other scenarios where, for example, the compiler will infer that a method returns a union type.

```crystal
text = "Hello world"[10]?
p typeof(text) # => (Char | Nil)
```

[union-type]: https://crystal-lang.org/reference/latest/syntax_and_semantics/union_types.html
[typeof]: https://crystal-lang.org/reference/syntax_and_semantics/typeof.html
[Object#class]: https://crystal-lang.org/api/latest/Object.html#class-instance-method
[is_a?]: https://crystal-lang.org/reference/latest/syntax_and_semantics/is_a.html
[as]: https://crystal-lang.org/reference/latest/syntax_and_semantics/as.html
[as?]: https://crystal-lang.org/reference/latest/syntax_and_semantics/as_question.html
