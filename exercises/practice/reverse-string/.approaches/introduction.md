# Introduction

There are various ways to solve **reverse-string**.
This exercise has a clear exemplar solution and that is the built-in `reverse` method.
However, this document will also explore other approaches.

## General guidance

The goal of this exercise is to reverse a string.

## Approach: Using the built-in `reverse` method

This is the most exemplary and straightforward solution.
It uses the built-in [`reverse` method][reverse-method] to reverse the string.

```crystal
module ReverseString
  def self.reverse(input : String) : String
    input.reverse
  end
end
```

For more information, check the [`reverse` approach][approach-reverse].

## Approach: Using an array

This approach converts the string to an array, reverses the array, and then converts the array back to a string.

```crystal
module ReverseString
  def self.reverse(input : String) : String
    result = Array(Char).new(input.size)
    input.each_char do |char|
        result.unshift(char)
    end
    result.join
  end
end
```

For more information, check the [Array approach][approach-array].

## Approach: Using String::Builder

This approach uses the [`String::Builder` class][string-builder] to build the reversed string.

```crystal
module ReverseString
  def self.reverse(input : String) : String
    result = String.build(input.size) do |builder|
      (0...input.size).reverse_each do |i|
        builder << input[i]
      end
    end
  end
end
```

For more information, check the [String::Builder approach][approach-string-builder].

## Benchmark

For more information, check the [Performance article][article-performance].

[approach-array]: https://exercism.org/tracks/crystal/exercises/reverse-string/approaches/array
[approach-string-builder]: https://exercism.org/tracks/crystal/exercises/reverse-string/approaches/string-builder
[article-performance]: https://exercism.org/tracks/crystal/exercises/reverse-string/articles/performance
[approach-reverse]: https://exercism.org/tracks/crystal/exercises/reverse-string/approaches/reverse
