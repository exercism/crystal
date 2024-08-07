# Array Methods

Arrays are a common data structure to work with.
Thereby, there is a collection of methods that can be used to deal with arrays.
Which includes sorting, reversing, inserting, and many more.

Some of these methods are destructive, which means that they modify the original array.
Others are non-destructive, meaning they return a new array and do not modify the original one.

Here are a few of the most common methods that can be used when dealing with arrays:

## insert

When inserting an element in an array, you can use the [`insert`][insert] method, which takes an index and an element as arguments.
The element will be inserted at the specified index, and the rest of the array will be shifted to the right.
If the index is out of bounds, then an `IndexError` will be raised.

```crystal
numbers = [1, 2, 3]
numbers.insert(1, 4)
numbers # => [1, 4, 2, 3]

numbers.insert(5, 5) # => Error: Index out of bounds (IndexError)
```

## delete

When you want to delete a specific element from an array, you can use the [`delete`][delete] method, which takes an element as an argument.
The method returns the element that was removed.
If the element does not exist in the array, then `nil` will be returned.

```crystal
numbers = [1, 2, 3]
numbers.delete(2) # => 2
numbers           # => [1, 3]
```

## first & last

When wanting to get the first or last element of an array, you can use the [`first`][first] and [`last`][last] methods.
These methods take an optional argument specifying how many elements to return.
These can improve readability compared to using the index `0` or `-1`, or using a range.
If the array is empty, an `Enumerable::EmptyError` will be raised.

```crystal
numbers = [1, 2, 3]
numbers.first # => 1
numbers.last  # => 3

numbers.first(2) # => [1, 2]
numbers.last(2)  # => [2, 3]

empty_array = [] of Int32
empty_array.last # => Error: Empty enumerable (Enumerable::EmptyError)
```

## reverse

When wanting to reverse an array, you can use the [`reverse`][reverse] method which returns a new array with the elements in reverse order.
It is important to note that `reverse` returns a new array and does not modify the original array.
If you want to modify the original array, add a `!` to the end of the method name.

```crystal
numbers = [1, 2, 3]
numbers.reverse # => [3, 2, 1]
numbers         # => [1, 2, 3]

numbers.reverse! # => [3, 2, 1]
numbers          # => [3, 2, 1]
```

## flatten & compact & transpose & uniq

The following methods are useful when performing operations like making an array one-dimensional, removing `nil` elements, removing duplicates, or transposing an array of arrays.
As with `reverse`, these methods return a new array and do not modify the original array.

| Method | Description | example |
| ------ | ----------- | ------- |
| [`flatten`][flatten] | Returns a new array that is a one-dimensional flattening of this array (recursively). That is, for every array element, extract its elements into the new array. | `[[1, 2], [3, 4]].flatten # => [1, 2, 3, 4]` |
| [`compact`][compact] | Returns a copy of self with all nil elements removed. | `[1, nil, 2, nil, 3].compact # => [1, 2, 3]` |
| [`transpose`][transpose] | Assumes that self is an array of arrays and [transposes][transpose] the rows and columns. | `[[1, 2], [3, 4]].transpose # => [[1, 3], [2, 4]]` |
| [`uniq`][uniq] | Returns a new array by removing duplicate values in self. | `[1, 2, 1, 3, 1].uniq # => [1, 2, 3]` |

## Concat(`+`)

The append method(`<<`) is useful when wanting to add objects to an array.
However, when combining two arrays, you can use the [`+`][concat] operator, which returns a new array with the elements of both arrays.

```crystal
[1, 2] + [3, 4] # => [1, 2, 3, 4]
```

If you append an array to another array, the array will be added as a single element.

```crystal
[1, 2] << [3, 4] # => [1, 2, [3, 4]]
```

## empty?

When checking if an array is empty, you can use the [`empty?`][empty?] method, which returns `true` if the array is empty and `false` otherwise.
This improves readability compared to checking the array's length against `0`.

```crystal
[].empty? # => true
[1, 2, 3].empty? # => false
```

## index

When you want to get the index of an element in an array, you can use the [`index`][index] method, which takes an element as an argument.
If the element does not exist in the array, then `nil` will be returned.

```crystal
numbers = [1, 2, 3]
numbers.index(2) # => 1
```

## count

When you want to count the number of elements in an array, you can use the [`count`][count] method, which takes an optional argument specifying the element to count.

```crystal
numbers = [1, 2, 3]
numbers.count # => 3
numbers.count(2) # => 1
```

## sort

When you want to sort an array, you can use the [`sort`][sort] method, which returns a new array with the elements sorted.
As with `reverse`, this method returns a new array and does not modify the original array.

```crystal
numbers = [3, 2, 1]
numbers.sort # => [1, 2, 3]
numbers      # => [3, 2, 1]

numbers.sort! # => [1, 2, 3]
numbers       # => [1, 2, 3]
```

[insert]: https://crystal-lang.org/api/latest/Array.html#insert%28index%3AInt%2Cobject%3AT%29%3Aself-instance-method
[delete]: https://crystal-lang.org/api/latest/Array.html#delete%28obj%29%3AT%7CNil-instance-method
[first]: https://crystal-lang.org/api/latest/Array.html#first%28n%3AInt%29%3AArray%28T%29-instance-method
[last]: https://crystal-lang.org/api/latest/Array.html#last%28n%3AInt%29%3AArray%28T%29-instance-method
[reverse]: https://crystal-lang.org/api/latest/Array.html#reverse%3AArray%28T%29-instance-method
[flatten]: https://crystal-lang.org/api/latest/Array.html#flatten-instance-method
[compact]: https://crystal-lang.org/api/latest/Array.html#compact-instance-method
[transpose]: https://crystal-lang.org/api/latest/Array.html#transpose-instance-method
[uniq]: https://crystal-lang.org/api/latest/Array.html#uniq%3AArray%28T%29-instance-method
[concat]: https://crystal-lang.org/api/latest/Array.html#%2B%28other%3AArray%28U%29%29%3AArray%28T%7CU%29forallU-instance-method
[empty?]: https://crystal-lang.org/api/latest/Indexable.html#empty%3F%3ABool-instance-method
[index]: https://crystal-lang.org/api/latest/Array.html#index%28object%2Coffset%3AInt%3D0%29-instance-method
[count]: https://crystal-lang.org/api/latest/Enumerable.html#count%28%26%3AT-%3E%29%3AInt32-instance-method
[sort]: https://crystal-lang.org/api/latest/Array.html#sort%3AArray%28T%29-instance-method
