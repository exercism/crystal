module Grains
  extend self

  def square(number : Number) : Number
    raise ArgumentError.new "square must be between 1 and 64" if number <= 0 || number > 64
    2.to_u64**(number - 1)
  end

  def total : UInt64
    (2.to_u128**64 - 1).to_u64
  end
end
