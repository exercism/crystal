module BookStore
  def self.total(basket : Array(Int32))
    groups = Hash(Int32, Int32).new(0)
    basket = basket.tally

    while !basket.empty?
      groups[basket.size] += 1
      basket.each { |k, v| basket[k] = v - 1 }
      basket.reject! { |_, v| v.zero? }
    end

    while groups[3] > 0 && groups[5] > 0
      groups[3] -= 1
      groups[5] -= 1
      groups[4] += 2
    end

    groups.map do |size, count|
      ((BOOK_PRICE * size) * GROUP_SIZE_FACTOR[size]) * count
    end.sum
  end

  BOOK_PRICE        = 800
  GROUP_SIZE_FACTOR = {1 => 1.00, 2 => 0.95, 3 => 0.90, 4 => 0.80, 5 => 0.75}
end
