class PascalsTriangle
  include Iterator(Array(Int32))

  def self.rows(n)
    raise ArgumentError.new("Number must not be less than zero") if n < 0
    new.first(n).to_a
  end

  def initialize
    @m = -1
  end

  def next
    @m += 1
    @m.times.reduce([1]) do |row, k|
      row << (row[k] * (@m - k) // (k + 1))
    end
  end
end
