require "benchmark"

module RaindropsConditional
  def self.convert(count : Int32) : String
    result = ""
    result += "Pling" if count.divisible_by?(3)
    result += "Plang" if count.divisible_by?(5)
    result += "Plong" if count.divisible_by?(7)
    result.blank? ? count.to_s : result
  end
end

module RaindropsDataDriven
  DROPS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}

  def self.convert(number : Int)
    DROPS.join { |k, v| v if number.divisible_by?(k) }.presence || number.to_s
  end
end

puts "RaindropsConditional"
puts Benchmark.measure {
    RaindropsConditional.convert(5130)
}

puts "RaindropsDataDriven"
puts Benchmark.measure {
    RaindropsDataDriven.convert(5130)
}
