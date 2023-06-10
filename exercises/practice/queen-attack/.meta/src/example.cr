class Queen
  protected getter row, column

  def initialize(@row : Int8, @column : Int8)
    raise ArgumentError.new unless (0..7).includes? @row
    raise ArgumentError.new unless (0..7).includes? @column
  end

  def can_attack?(other : Queen) : Bool
    same_row?(other) || same_column?(other) || same_diagonal?(other)
  end

  private def same_row?(other : Queen) : Bool
    row == other.row
  end

  private def same_column?(other : Queen) : Bool
    column == other.column
  end

  private def same_diagonal?(other : Queen) : Bool
    (row - other.row).abs == (column - other.column).abs
  end
end
