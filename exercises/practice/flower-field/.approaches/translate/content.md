# Iteration and `tr` method

```crystal
class FlowerField
  def initialize(@board : Array(String))
  end

  def annotate
    @board.map_with_index do |row, y|
      row.chars.map_with_index do |cell, x|
        cell.to_s.tr(" ", annotated_space(x, y))
      end.join
    end
  end

  private def annotated_space(x, y)
    ([y - 1, 0].max..[y + 1, @board.size - 1].min).sum do |y|
      ([x - 1, 0].max..[x + 1, @board[0].size - 1].min).count do |x|
        @board[y][x] == '*'
      end
    end.to_s.tr("0", " ")
  end
end
```

What makes this approach interesting is the use of the [`tr` method][tr-method], which allows us to have a concise solution that doesn't use conditionals.
This approach starts with defining a `initialize` method that takes an `Array(String)` as an argument and assigns it to an instance variable `@board`.
The `annotate` method starts with mapping over the `@board` array with the index `y` for each row.
Then, it converts each row into an array of characters and maps over it with the index `x` for each cell.
It converts each cell from a `Char` to a `String` and then uses the method `tr`.

The `tr` method allows you to replace a set of characters with another set of characters in a string.
This is useful since it allows us to replace only the space character with the result of the `annotated_space` method.

The `annotated_space` method takes the `x` and `y` coordinates of the cell and calculates the number of flowers around it.
It then creates a range representing the area's height to check for flowers.
Since the index is 0, taking minus 1 would make the value -1, which would be valid in Crystal but would represent the last element.
We don't want this behavior, so we use the [`max`][max-method] method to ensure that the value is at least 0.
The same is done for the [`min`][min-method] value, but here we want to ensure that the value is, at most, the last index.

Then, we use the [`sum`][sum-method] method to sum the total number of flowers returned by the inner loop.
The inner loop creates a range representing the area's width to check for flowers.
As before, we use the `max` and `min` methods to ensure that the values are within the board's bounds.
Then, we use the [`count`][count-method] method to count how many times the inner condition is true, which indicates whether the cell is a flower or not.

Finally, we convert the sum to a string and use the `tr` method to replace all the zeros with spaces.

[tr-method]: https://crystal-lang.org/api/String.html#tr%28from%3AString%2Cto%3AString%29%3AString-instance-method
[sum-method]: https://crystal-lang.org/api/Enumerable.html#sum-instance-method
[count-method]: https://crystal-lang.org/api/Enumerable.html#count%28%26%3AT-%3E%29%3AInt32-instance-method
[max-method]: https://crystal-lang.org/api/Enumerable.html#max%3AT-instance-method
[min-method]: https://crystal-lang.org/api/Enumerable.html#min%3AT-instance-method
