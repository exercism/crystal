module AtbashCipher
  extend self

  PLAIN  = "abcdefghijklmnopqrstuvwxyz"
  CIPHER = PLAIN.reverse

  def encode(message : String) : String
    message
      .downcase
      .tr(PLAIN, CIPHER)
      .chars
      .select(&.alphanumeric?)
      .each_slice(5)
      .map(&.join)
      .join(" ")
  end

  def decode(message : String) : String
    message
      .tr(CIPHER, PLAIN)
      .chars
      .select(&.alphanumeric?)
      .join
  end
end
