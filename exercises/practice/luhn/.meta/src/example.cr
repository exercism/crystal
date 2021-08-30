module Luhn
  extend self

  def valid?(input : String) : Bool
    clean = input.chars.reject(&.whitespace?)

    return false if clean.size <= 1 || clean.any? { |g| !g.number? }

    double_every_second = clean
      .reverse
      .map(&.to_i)
      .map_with_index do |d, i|
        b = i.odd? ? d * 2 : d
        b > 9 ? b - 9 : b
      end

    double_every_second.sum % 10 == 0
  end
end
