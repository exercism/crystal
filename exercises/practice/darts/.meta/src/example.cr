module Darts
  extend self

  def score(x : Number, y : Number) : Number
    hypot = Math.hypot(x, y)
    if hypot <= 1
      10
    elsif hypot <= 5
      5
    elsif hypot <= 10
      1
    else
      0
    end
  end
end
