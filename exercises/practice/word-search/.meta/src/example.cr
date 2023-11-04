module WordSearch
  alias Location = Tuple(Tuple(Int32, Int32), Tuple(Int32, Int32))

  def self.search(grid, words)
    grid = grid.map(&.chars)
    row_count = grid.size
    column_count = grid[0].size
    results = Hash(String, Location | Nil).new

    words.each do |word|
      results[word] = nil

      grid.each_with_index do |row, r|
        if c = row.join.index(word)
          results[word] = { {c + 1, r + 1}, {c + word.size, r + 1} }
          break
        end

        if c = row.join.index(word.reverse)
          results[word] = { {c + word.size, r + 1}, {c + 1, r + 1} }
          break
        end
      end

      grid.transpose.each_with_index do |row, r|
        if c = row.join.index(word)
          results[word] = { {r + 1, c + 1}, {r + 1, c + word.size} }
          break
        end

        if c = row.join.index(word.reverse)
          results[word] = { {r + 1, c + word.size}, {r + 1, c + 1} }
          break
        end
      end

      ((-column_count + 1)...column_count).each do |starting_column|
        diagonal = (0...row_count).compact_map do |row|
          grid[row][row + starting_column]? if row + starting_column >= 0
        end

        start = {[starting_column, 0].max, [-starting_column, 0].max}

        if c = diagonal.join.index(word)
          results[word] = { {start[0] + c + 1, start[1] + c + 1}, {start[0] + word.size, start[1] + word.size} }
          break
        end

        if c = diagonal.join.index(word.reverse)
          results[word] = { {start[0] + c + word.size, start[1] + c + word.size}, {start[0] + c + 1, start[1] + c + 1} }
          break
        end
      end

      (0...(2 * column_count - 1)).each do |starting_column|
        diagonal = (0...row_count).compact_map do |row|
          grid[row][starting_column - row]? if starting_column - row >= 0
        end.reverse

        start = {[starting_column - row_count + 1, 0].max, [starting_column, column_count - 1].min}

        if c = diagonal.join.index(word)
          results[word] = { {start[0] + c + 1, start[1] - c + 1}, {start[0] + c + word.size, start[1] - word.size} }
          break
        end

        if c = diagonal.join.index(word.reverse)
          results[word] = { {start[0] + c + word.size, start[1] - word.size + 1}, {start[0] + c + 1, start[1] - c + 1} }
          break
        end
      end
    end

    results
  end
end
