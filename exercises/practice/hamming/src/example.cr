class Hamming
  def self.distance(strand1 : String, strand2 : String)
    if strand1.size == strand2.size
      strand1.chars.zip(strand2.chars).count { |first, second| first != second }
    else
      raise ArgumentError.new(message = "Strands must be of equal length")
    end
  end
end
