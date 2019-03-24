module PrimeFactors
  extend self

  def factors(value : Int64) : Array(Int32)
    factors = [] of Int32
    divisor = 2
    while value > 1
      while (value.divisible_by? divisor)
        factors << divisor
        value = value / divisor
      end
      divisor += 1
    end
    factors
  end
end
