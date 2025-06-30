# Introduction

There are various ways to solve **Flower Field**.

## Approach: Using translation

Using the `tr` method to translate the result of the `annotated_space` method.
This solution is very concise since it doesn't need any conditionals.
It does this by using looping and the `tr` method.

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
    ([y - 1, 0].max..[y + 1, @board.size - 1].min).map do |y|
      ([x - 1, 0].max..[x + 1, @board[0].size - 1].min).count do |x|
        @board[y][x] == '*'
      end
    end.sum.to_s.tr("0", " ")
  end
end
```

For more information, see the [translate approach][approach-translate], or if you want to hear Erik Schierboom's thoughts on this approach, see the [video][video-translate].

## Approach: Using a data-driven approach

Using rules to create logic to check for flowers.
This solution is concise and flexible. If the rules change, it is as easy as changing the rules.

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
        sum = 0
        OFFSETS.each do |(dx, dy)|
          new_x = x + dx
          new_y = y + dy
          if new_x < 0 || new_x > ncols - 1 || new_y < 0 || new_y > nrows - 1 || @board[new_y][new_x] == ' '
            next
          end
          sum += 1
        end
        sum == 0 ? ' ' : sum.to_s
      end.join
    end
  end
end
```

For more information, check the [data-driven approach][approach-data-driven].

[approach-data-driven]: https://exercism.org/tracks/crystal/exercises/flower-field/approaches/data-driven
[approach-translate]: https://exercism.org/tracks/crystal/exercises/flower-field/approaches/translate
[video-translate]: https://youtu.be/dLT2h2hODhs?t=951
