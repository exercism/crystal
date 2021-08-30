module ArmstrongNumbers
  extend self

  def armstrong_number?(input : Number) : Bool
    number = "#{input}"
    length = number.size

    input == number.chars.reduce(0) { |acc, i| acc + i.to_i**length }
  end
end
