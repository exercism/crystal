module SumOfMultiples
  extend self

  def sum(factors : Array(Number), limit : Number) : Number
    (1...limit).select { |f| factors.any? { |h| !h.zero? && f.divisible_by? h } }.sum
  end
end
