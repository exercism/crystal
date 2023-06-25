module SaddlePoints
  def self.saddle_points(matrix : Array(Array(Int32))) : Set(NamedTuple(row: Int32, column: Int32))
    result = Set(NamedTuple(row: Int32, column: Int32)).new
    matrix.each_with_index do |row, i|
      row.each_with_index do |value, j|
        if value == row.max && value == matrix.transpose[j].min
          result << {row: i + 1, column: j + 1}
        end
      end
    end
    result
  end
end
