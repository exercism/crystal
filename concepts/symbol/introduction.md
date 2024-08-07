# About

[Symbols][symbols] are named identifiers that can be used to refer to a value.
Symbols are created through a symbol literal, which is by prefixing a name with a `:` character, e.g. `:foo`.
They also allow for being written with quotes, e.g. `:"foo"`, which allows, for example, spaces in the name.

```crystal
:foo # => :foo
:"foo boo" # => :"foo boo"
```

Symbols are used in many places in the language, including as keys in namedtuples, to represent method names and variable names.

## Symbols in Crystal

Symbols in Crystal is quite different from Ruby.
In Crystal is a symbol a form of constants and is thereby is assigned at compile time.
This means that symbols can't be created dynamically, which is possible in Ruby.

Symbols in Crystal is represented as an `Int32` which makes very efficient.

## Identifier

What makes symbols different from strings is that they are identifiers, and do not represent data or text.
This means that two symbols with the same name are always the same object.

```ruby
"foo".object_id # => 60
"foo".object_id # => 80
:foo.object_id # => 1086748
:foo.object_id # => 1086748
```

## Conversion

Symbols can be converted to strings but not vice versa.
This is because symbols are created at compile time, and strings are created at runtime.

```crystal
:foo.to_s # => "foo"
```

[symbols]: https://crystal-lang.org/reference/syntax_and_semantics/literals/symbol.html
