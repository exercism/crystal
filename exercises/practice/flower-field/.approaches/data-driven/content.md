# Data Driven

```crystal
class FlowerField
  OFFSETS = [
    {-1, -1}, {0, -1}, {1, -1},
    {-1,  0},          {1,  0},
    {-1,  1}, {0,  1}, {1,  1},
  ]

  def initialize(@board : Array(String) )
  end

  def annotate()
    nrows = @board.size()
    
    @board.map_with_index do |row, y|
      ncols = row.size()
      row.chars.map_with_index do |cell, x|
        if cell == '*'
          next '*'
        end
        sum = OFFSETS.count do |(dx, dy)|
          new_x = x + dx
          new_y = y + dy
 new_x >= 0 && new_x < ncols && new_y >= 0 && new_y < nrows && @board[new_y][new_x] == '*'
        end
        sum == 0 ? ' ' : sum.to_s
      end.join
    end
  end
end
```

Using a data-driven approach to create logic to solve Flower Field makes the solution concise and flexible.
If the rules change, it is as easy as to change them.
The solution starts by creating an `Array` with the rules which are tuples with the x and y offset.
Defining an `initialize` method takes an `Array(String)` as an argument and assigns it to an instance variable `@board`.

The `annotate` method starts by defining the number of rows on the board.
Then it maps over the `@board` array with the index `y` for each row.
Then, it converts each row into an array of `Char` and maps over it with the index `x` for each cell.

If a cell is a flower, it will be skipped and the flower will be returned.
Otherwise, it will count the number of flowers around the cell.
It will do this by having the rules defined beforehand and then calculating the new x and y positions for each rule.
It will then check if the new x and y positions are within the board's bounds and if the cell is a flower.
If it is, the count will be increased.

Finally, it will check if the sum is 0.
If it is, it will return a space; otherwise, it will return the sum as a string.
Then, it will join the row and return to the board.
