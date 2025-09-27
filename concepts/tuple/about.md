# Tuples

A [tuple][tuple] is a finite ordered list of elements which is immutable.
Tuples requires all positions to have a fixed type.
This in turns means that the compiler knows what type is at each position.
The types used in a tuple can be different at each position, but the types must be known at compile time.

## Creating a Tuple

Depending on if the tuples values types can be interpreted under compilation, the tuple can be created in different ways.
If the values are known at compile time, the tuple can be created using the tuple literal syntax, otherwise they need to be explicitly declared.
It is also important that the types of the values match the types specified in the tuple and that the number of values matches the number of types specified.
Here is an example of defining through tuple literal syntax:

```crystal
tuple = {1, "foo", 'c'} # Tuple(Int32, String, Char)
```

There is also the possibility to create a tuple using the `Tuple` class.

```crystal
tuple = Tuple(Int32, String, Char).new(1, "foo", 'c')
```

Alternatively, you can explicitly specify the type of the variable assigned to the tuple.

```crystal
tuple : Tuple(Int32, String, Char) = {1, "foo", 'c'}
```

Explicitly specifying the type of the tuple can be useful since that allows for defining that a position should hold a union type.
This means that a position can hold multiple types.

```crystal
tuple : Tuple(Int32 | String, String, Char) = {1, "foo", 'c'}
```

## Conversion

### Creating a tuple from an array

You can create a tuple from an array using the `Tuple` class's `from` method.
This requires that the type of the tuple is specified.

```crystal
array = [1, "foo", 'c']
tuple = Tuple(Int32, String, Char).from(array)
```

### Conversion to Array

You can convert a tuple to an array using the `to_a` method.
The resulting array's element type is the union of the type of each field in the tuple.

```crystal
tuple = {1, "foo", 'c'}
array = tuple.to_a
array # => [1, "foo", 'c']
```

### Tuples definition shorthand

There is a shorthand for defining explicit tuple types.
That is by writing the types inside of the tuple literal.

```crystal
tuple : {Int32, String, Char} = {1, "foo", 'c'}
```

## Accessing Elements

Like arrays, tuples are zero-indexed, meaning that the first element is at index 0.
However, unlike arrays, the type of each element is fixed and known at compile time, therefore when indexing a tuple, the type of the element is specific to the position.
To access an element in a tuple, you can use the `[]` operator.

```crystal
array = [1, "foo", 'c']
array[0]         # => 1
typeof(array[0]) # => Int32 | String | Char

tuple = {1, "foo", 'c'}
tuple[0]         # => 1
typeof(tuple[0]) # => Int32
```

Another difference when it comes to accessing elements from arrays is that if the index is specified, then the compiler will check that the index is within the bounds of the tuple.
This means you will get a compile time error instead of a runtime error.

```crystal
tuple = {1, "foo", 'c'}
tuple[3]
# => Error: index out of bounds for Tuple(Int32, String, Char) (3 not in -3..2)
```

However, if the index is stored in a variable, then the compiler will not be able to check if the index is within the bounds of the tuple at compile time and will instead give a runtime error.

## Subtuple

You can get a subtuple of a tuple by using the `[]` operator with a range.
What is returned is a new tuple with the elements from the range specified.
The range has to be given at compile time, otherwise the compiler will not be able to know the types of the elements in the subtuple.
This means that the range has to be a range literal and not assigned to a variable.

```crystal
tuple = {1, "foo", 'c'}
subtuple = tuple[0..1] # Tuple(Int32, String)

i = 0..1
tuple[i]
# Error: Tuple#[](Range) can only be called with range literals known at compile-time
```

## When to use a Tuple

Tuples are useful when you want to group a fixed number of values together where the types of the values are known at compile time.
This is because tuples require less memory and are faster than arrays due to the immutability of tuples.
Another use case is returning multiple values from a method.
This is particularly helpful if the values have different types since each position in the tuple can have a different type.

Tuples should not be used when a data structure is needed that can grow or shrink in size or often needs to be modified.

[tuple]: https://crystal-lang.org/reference/syntax_and_semantics/literals/tuple.html
