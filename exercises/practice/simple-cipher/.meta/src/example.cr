class SimpleCipher
  A_CODEPOINT = 'a'.ord
  Z_CODEPOINT = 'z'.ord
  @key : String

  def initialize
    @key = (1..100).map { |_i| Random.rand(A_CODEPOINT..Z_CODEPOINT).chr }.join
  end

  def initialize(key : String)
    @key = key
  end

  def key
    @key
  end

  def encode(text : String)
    (0...text.size).map { |i| encode_codepoint(text.codepoint_at(i), @key.codepoint_at(i % @key.size)) }.join
  end

  def decode(text : String)
    (0...text.size).map { |i| decode_codepoint(text.codepoint_at(i), @key.codepoint_at(i % @key.size)) }.join
  end

  private def encode_codepoint(text_point : Int32, key_point : Int32) : Char
    encoded = text_point + key_point - A_CODEPOINT
    if encoded > Z_CODEPOINT
      return (encoded - 26).chr
    end
    return encoded.chr
  end

  private def decode_codepoint(text_point : Int32, key_point : Int32) : Char
    decoded = text_point - key_point + A_CODEPOINT
    if decoded < A_CODEPOINT
      return (26 + decoded).chr
    end
    return decoded.chr
  end
end
