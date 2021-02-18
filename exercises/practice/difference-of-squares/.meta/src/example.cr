module Squares
  extend self

  def square_of_sum(num)
    (num * (num + 1) / 2) ** 2
  end

  def sum_of_squares(num)
    num * (num + 1) * (2 * num + 1) / 6
  end

  def difference_of_squares(num)
    square_of_sum(num) - sum_of_squares(num)
  end
end
