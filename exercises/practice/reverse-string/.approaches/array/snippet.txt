def self.reverse(input : String) : String
  result = Array(String).new(input.size)
  input.each_char do |char|
    result.unshift(char)
  end
  result.join
end
