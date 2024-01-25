require "benchmark"

module YearBooleanChain
  def self.leap?(year : Number) : Bool
    year.divisible_by?(4) && (year.divisible_by?(400) || !year.divisible_by?(100))
  end
end

module YearCase
  def self.leap?(year : Number) : Bool
    case year
    when .divisible_by? 400
      true
    when .divisible_by? 100
      false
    when .divisible_by? 4
      true
    else
      false
    end
  end
end

module YearRules
  RULES = [
    p_divisible_by?(4),
    p_or(
      p_negate(p_divisible_by?(100)),
      p_divisible_by?(400)),
  ]

  def self.leap?(year) : Bool
    RULES.map(&.call(year)).all?
  end

  def self.p_divisible_by?(num : Int32) : Proc(Int32, Bool)
    ->(year : Int32) { year.divisible_by?(num) }
  end

  def self.p_negate(test : Proc(A, Bool)) : Proc(A, Bool) forall A
    ->(input : A) { !test.call(input) }
  end

  def self.p_or(a : Proc(A, Bool), b : Proc(A, Bool)) : Proc(A, Bool) forall A
    ->(input : A) { a.call(input) || b.call(input) }
  end
end

puts "YearCase"
puts Benchmark.measure {
  YearCase.leap?(2014)
}

puts "YearBooleanChain"
puts Benchmark.measure {
  YearBooleanChain.leap?(2014)
}

puts "YearRules"
puts Benchmark.measure {
  YearRules.leap?(2014)
}

