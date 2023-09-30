module SpiralMatrix
  def self.spiral_matrix(size)
    matrix = Array.new(size) { Array(Int32).new(size, 0) }
    x, y = 0, 0
    dx, dy = 1, 0

    (1..size**2).each do |i|
      matrix[y][x] = i
      if x + dx >= size || x + dx < 0 || y + dy >= size || y + dy < 0 || matrix[y + dy][x + dx] != 0
        dx, dy = -dy, dx
      end
      x += dx
      y += dy
    end

    matrix
  end
end
