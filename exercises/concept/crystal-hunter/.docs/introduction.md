# Bools

Crystal has a type known as [`Bool`][bools], it is used to represent the values `true` and `false`.

## Logical operators

Crystal has 3 logical operators (`!`, `||`, `&&`) which are used to combine Bools and make expressions that produce different values.

### And(`&&`)

The [_and_ operator][and] in Crystal is represented by `&&` and returns `true` if both values given are `true` otherwise it returns `false`.
When using the _and_ operator, one Bool be placed on the right side of the `&&` and another one on the left side.

```crystal
true && true
# => true

true && false
# => false
```

### Or(`||`)

The [_or_ operator][or] in Crystal is represented by `||` and returns `true` if **at least one** of values given is `true` if both of the values are `false` then it returns `false`.
When using the _or_ operator one bool should be placed on the right side of the `||` and another one on the left side.

```crystal
true || true
# => true

true || false
# => true

false || false
# => false
```

### Not(`!`)

The _not_ operator in Crystal is represented by `!` and returns `true` if the given Bool is `false` and returns `false` if `true` is given.
When using the _not_ operator one Bool should be placed after the operator (`!`).

```crystal
!true
# => false

!false
# => true
```

## Using parentheses(`()`)

When working with booleans you can use parentheses to decide which Bools to evaluate first.
The result can differ depending on how the parentheses are used.
In Crystal, what is in parentheses is evaluated first.

```crystal
true && false && false || true
# => true

true && false && (false || true)
# => false
```

Since what is in parentheses is evaluated first, in the following example, the _not_ operator will apply to the expression inside parentheses.

```crystal
!true && false
# => false

!(true && false)
# => true
```

~~~~exercism/note
You should only use parentheses when they affect the result, otherwise, should they be omitted.
~~~~

[bools]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/bool.html
[and]: https://crystal-lang.org/reference/latest/syntax_and_semantics/and.html
[or]: https://crystal-lang.org/reference/latest/syntax_and_semantics/or.html
