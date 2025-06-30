class FlowerField
  property input

  def initialize(@input : Array(String))
  end

  def annotate : Array(String)
    input.map_with_index do |row, row_index|
      row.chars.map_with_index do |cell, col_index|
        cell == ' ' ? count_flowers(input, row_index, col_index) : cell
      end.join
    end
  end

  private def count_flowers(input, row_index, col_index) : String
    count = 0
    (row_index - 1..row_index + 1).each do |row|
      (col_index - 1..col_index + 1).each do |col|
        if row < 0 || col < 0 || row >= input.size || col >= input[0].size
          next
        end
        count += 1 if input[row][col] == '*'
      end
    end
    count == 0 ? " " : count.to_s
  end
end
