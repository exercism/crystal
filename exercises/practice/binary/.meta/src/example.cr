class Binary
  def self.to_decimal(binary)
    new(binary).to_decimal
  end

  def initialize(binary)
    raise ArgumentError.new if binary.match(/[^0-1]/)
    @binary = binary
  end

  def to_decimal
    binary.chars.reduce(0) do |decimal, char|
      (decimal * 2) + char.to_i
    end
  end

  private getter binary : String
end
