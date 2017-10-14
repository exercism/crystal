class Triangle
  def initialize(sides)
    @sides = sides
    @sides = [] of Int32 if illegal?
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