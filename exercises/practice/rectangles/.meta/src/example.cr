module Rectangles
  private struct Point
    getter x, y

    def initialize(@x : Int32, @y : Int32); end
  end

  def self.rectangles(input)
    corners(input)
      .combinations(2)
      .select { |p| (p[0].x < p[1].x) && (p[0].y < p[1].y) }
      .select { |p| forms_rectangle?(input, p[0], p[1]) }
      .size
  end

  private def self.forms_rectangle?(input, p1, p2)
    horizontal_line_connecting?(input, Point.new(p1.x, p1.y), Point.new(p2.x, p1.y)) &&
      horizontal_line_connecting?(input, Point.new(p1.x, p2.y), Point.new(p2.x, p2.y)) &&
      vertical_line_connecting?(input, Point.new(p1.x, p1.y), Point.new(p1.x, p2.y)) &&
      vertical_line_connecting?(input, Point.new(p2.x, p1.y), Point.new(p2.x, p2.y))
  end

  private def self.horizontal_line_connecting?(input, p1, p2)
    (p1.x..p2.x).all? { |x| ['+', '-'].includes? input[p1.y][x] }
  end

  private def self.vertical_line_connecting?(input, p1, p2)
    (p1.y..p2.y).all? { |y| ['+', '|'].includes? input[y][p1.x] }
  end

  private def self.corners(input)
    input.map_with_index do |row, y|
      row.chars.map_with_index do |cell, x|
        Point.new(x, y) if cell == '+'
      end
    end.flatten.compact
  end
end
