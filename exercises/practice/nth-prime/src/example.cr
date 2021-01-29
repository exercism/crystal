module NthPrime
  extend self

  def prime(number : Number) : Number
    raise ArgumentError.new "there is no zeroth prime" if number < 1

    primes = 0
    i = 1

    while primes < number
      i += 1
      primes += 1 if prime?(i)
    end
    i
  end

  private def prime?(n)
    return false if n == 1
    return true if n == 2
    return !(2..Math.sqrt(n)).any? { |i| n % i == 0 }
  end
end
