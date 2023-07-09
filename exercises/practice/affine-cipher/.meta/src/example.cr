module AffineCipher
  def self.encode(a, b, plaintext)
    raise ArgumentError.new unless coprime_to_m?(a)

    normalized = plaintext.downcase.gsub(/[^a-z0-9]/, "")
    partition normalized.chars.map { |c| encode_char(a, b, c) }.join
  end

  def self.decode(a, b, ciphertext)
    raise ArgumentError.new unless coprime_to_m?(a)

    normalized = ciphertext.gsub(/ /, "")
    normalized.chars.map { |c| decode_char(a, b, c) }.join
  end

  private def self.encode_char(a, b, c)
    return c if /\d/.matches? c.to_s

    x = c.ord - 'a'.ord
    (((a * x + b) % m) + 'a'.ord).chr
  end

  def self.decode_char(a, b, c)
    return c if /\d/.matches? c.to_s

    y = c.ord - 'a'.ord
    ((mmi(a).not_nil! * (y - b)) % m + 'a'.ord).chr
  end

  def self.mmi(a)
    (0...m).find { |n| (a * n) % m == 1 }
  end

  private def self.m
    26
  end

  def self.partition(s)
    s.scan(/.{1,5}/).map(&.[0]).join(' ')
  end

  def self.coprime_to_m?(a)
    !mmi(a).nil?
  end
end
