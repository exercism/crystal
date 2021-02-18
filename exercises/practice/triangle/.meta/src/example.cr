class Triangle
  @sides : Array(Int32) | Array(Float64)

  def initialize(sides : Tuple(Int32, Int32, Int32) | Tuple(Float64, Float64, Float64))
    @sides = sides.to_a
    raise ArgumentError.new("illegal triangle") if illegal?
  end

  def equilateral?
    @sides.uniq.size == 1
  end

  def isosceles?
    1 <= @sides.uniq.size <= 2
  end

  def scalene?
    @sides.uniq.size == 3
  end

  private def illegal?
    impossible_length_side? || violates_inequality?
  end

  private def violates_inequality?
    a, b, c = @sides
    a + b <= c || a + c <= b || b + c <= a
  end

  private def impossible_length_side?
    @sides.any? { |side| side <= 0 }
  end
end
