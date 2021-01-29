require "spec"
require "../src/*"

describe "PrimeFactors" do
  it "no factors" do
    PrimeFactors.factors(1).should eq([] of Int32)
  end

  pending "prime number" do
    PrimeFactors.factors(2).should eq([2])
  end

  pending "square of a prime" do
    PrimeFactors.factors(9).should eq([3, 3])
  end

  pending "cube of a prime" do
    PrimeFactors.factors(8).should eq([2, 2, 2])
  end

  pending "product of primes and non-primes" do
    PrimeFactors.factors(12).should eq([2, 2, 3])
  end

  pending "product of primes" do
    PrimeFactors.factors(901255).should eq([5, 17, 23, 461])
  end

  pending "factors include a large prime" do
    PrimeFactors.factors(93819012551).should eq([11, 9539, 894119])
  end
end
