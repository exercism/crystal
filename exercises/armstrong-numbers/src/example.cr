module ArmstrongNumbers
  extend self

  def isArmstrongNumber(input : Number)
    number = "#{input}"
    length = number.size

    input == number.chars.reduce(0) { |acc, i| acc + i.to_i**length }
  end
end
