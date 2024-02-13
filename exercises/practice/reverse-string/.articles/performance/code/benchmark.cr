require "benchmark"

module ReverseString
  def self.reverse(input : String) : String
    input.reverse
  end
end

module ReverseStringArray
  def self.reverse(input : String) : String
    result = Array(Char).new(input.size)
    input.each_char do |char|
        result.unshift(char)
    end
    result.join
  end
end

module ReverseStringStringBuild
  def self.reverse(input : String) : String
    result = String.build(input.size) do |builder|
      (0...input.size).reverse_each do |i|
        builder << input[i]
      end
    end
  end
end

puts "ReverseString, short string"
puts Benchmark.measure {
    ReverseString.reverse("Hello World")
}

puts "ReverseStringArray, short string"
puts Benchmark.measure {
    ReverseStringArray.reverse("Hello World")
}

puts "ReverseStringStringBuild, short string"
puts Benchmark.measure {
    ReverseStringStringBuild.reverse("Hello World")
}

puts "ReverseString, long string"
puts Benchmark.measure {
    ReverseString.reverse("Hello World" * 1000)
}

puts "ReverseStringArray, long string"
puts Benchmark.measure {
    ReverseStringArray.reverse("Hello World" * 1000)
}

puts "ReverseStringStringBuild, long string"
puts Benchmark.measure {
    ReverseStringStringBuild.reverse("Hello World" * 1000)
}
