module VariableLengthQuantity
  def self.decode(bytes : Array(Number))
    values = [] of UInt32
    n : UInt32 = 0
    bytes.each_with_index do |byte, i|
      n = n << 7
      n = n + (byte & 0x7f)
      if byte & 0x80 == 0
        values << n
        n = 0
      end
      raise ArgumentError.new unless (i != bytes.size - 1) || (byte & 0x80 == 0)
    end
    values
  end

  def self.encode(values : Array(Number))
    values.flat_map { |value| encode(value) }
  end

  private def self.encode(n : Number)
    bytes = [n & 0x7f]
    n = n >> 7
    while n > 0
      bytes << (n & 0x7f | 0x80)
      n = n >> 7
    end
    bytes.reverse
  end
end
