# About

[Symbols][symbols] are named identifiers that can be used to refer to a value.
Symbols are created through a symbol literal, which is by prefixing a name with a `:` character, e.g. `:foo`.
They also allow for being written with quotes, e.g. `:"foo"`, which allows, for example, spaces in the name.

```crystal
:foo           # => :foo
:"foo boo"     # => :"foo boo"
:foo == :"foo" # => true
```

Symbols are used in many places in the language, including as keys in namedtuples and to represent method and variable names.

## Symbols in Crystal

Symbols in Crystal are quite different from Ruby.
In Crystal a symbol is a type of constant and thereby is assigned at compile time.
This means that symbols can't be created dynamically, which is possible in Ruby.

Symbols in Crystal are represented as `Int32`s which makes them very efficient.

## Conversion

Symbols can be converted to strings but not vice versa.
This is because symbols are created at compile time and strings are created at runtime.

```crystal
:foo.to_s # => "foo"
```

[symbols]: https://crystal-lang.org/reference/syntax_and_semantics/literals/symbol.html
