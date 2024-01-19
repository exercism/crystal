# Nil

Crystal has a type which is called [`Nil`][nil], it can only have one value: `nil`.
It is used to represent the absence of a value, and is similar to `null` or `None` in other languages.

Nil values can be returned from various methods for example [`String#[]?`][string-index], which returns `nil` if the index is out of bounds.

```crystal
"foo"[10]? # => nil
```

Crystal has what is known as **NULL REFERENCE CHECKS**, which means that all types are non-nilable by default.
This means that you can not assign `nil` to a variable unless you explicitly declare it as a `Nil` type.
In turn this means that the compiler will automatically check for null references.

## Falsey value

To be able to handle `nil` values, are there certain approaches that can be taken.
`nil` is a [falsey][truthy-falsey] value as well are `false`.
This means that in if statements and other places where a falsey or truthy value is expected it will be treated the same as `false`.

```crystal
if nil
  puts "nil is truthy"
else
  puts "nil is falsey"
end

# => nil is falsey
```

This means that the truthy branch won't be taken if a nilable variable has a value of `nil`.

```crystal
foo = "boo"[2]? # It is possible that foo is nil
if foo
  p foo.class # => Char
end
```

## Check for nil

Crystal has a method that can be used to check if a value is `nil`.
It is called [`nil?`][nil?] and it is available on all objects.

```crystal
foo = "boo"[2]?
if foo.nil?
  puts "foo is nil"
else
  puts "foo is not nil"
end
```

This is a bit different when just using the value in an if statement, since in the last examples would both false and nil be treated as false.
Here only `nil` is treated as falsy, since if it was false it wouldn't have been nil thereby it would have been truthy.

## Or operator

The easiest way to deal with `nil` values is by ensuring that the value never becomes `nil` in the first place.
The or operator ([`||`][or]) is often used when dealing with `Bools` but if understood correctly it can be used to deal with `nil` values as well.
The or operator checks if the first value is truthy, if not the second value is used.
This can be used to make if the value is `nil` it will be falsey and thereby the second value will be used.

```crystal
"foo"[10]? || "bar" # => "bar"
```

[nil]: https://crystal-lang.org/reference/syntax_and_semantics/literals/nil.html
[truthy-falsey]: https://crystal-lang.org/reference/latest/syntax_and_semantics/truthy_and_falsey_values.html
[nil?]: https://crystal-lang.org/api/latest/Object.html#nil?:Bool-instance-method
[string-index]: https://crystal-lang.org/api/latest/String.html#%5B%5D%3F%28index%3AInt%29%3AChar%7CNil-instance-method
[or]: https://crystal-lang.org/reference/latest/syntax_and_semantics/or.html
