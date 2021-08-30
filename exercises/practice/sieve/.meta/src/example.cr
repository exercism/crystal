module Primes
  extend self

  def sieve(limit)
    sieve_ar = Array.new(limit + 1, true)
    sieve_ar[0] = sieve_ar[1] = false

    2.step(to: Math.sqrt(limit)) do |i|
      next unless sieve_ar[i]
      (i*i).step(to: limit, by: i) { |ii| sieve_ar[ii] = false }
    end

    sieve_ar.each_with_index.reduce([] of Int32) { |p, (s, i)| s ? p << i : p }
  end
end
