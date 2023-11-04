module WordSearch
  alias Location = Tuple(Tuple(Int32, Int32), Tuple(Int32, Int32))

  def self.search(grid, words)
    grid = grid.map(&.chars)
    results = Hash(String, Location | Nil).new

    words.each do |word|
      results[word] = nil

      (0...grid[0].size).each do |x|
        (0...grid.size).each do |y|
          each_delta do |dx, dy|
            if end_point = find_end(grid, x, y, dx, dy, word)
              results[word] = { {x + 1, y + 1}, end_point }
            end
          end
        end
      end
    end

    results
  end

  private def self.each_delta
    [-1, 0, 1].each do |dx|
      [-1, 0, 1].each do |dy|
        yield(dx, dy) if dx != 0 || dy != 0
      end
    end
  end

  private def self.find_end(grid, x, y, dx, dy, word)
    return nil unless (0...grid[0].size).includes?(x) && (0...grid.size).includes?(y)
    return nil unless grid[y][x] == word[0]
    return {x + 1, y + 1} if word.size == 1
    find_end(grid, x + dx, y + dy, dx, dy, word[1...])
  end
end
