def self.reverse(input : String) : String
  result = String.build(input.size) do |builder|
    (0...input.size).reverse_each do |i|
      builder << input[i]
    end
  end
end
