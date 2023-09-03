module CryptoSquare
  def self.ciphertext(s)
    normalized = s.downcase.gsub(/[^a-z0-9]/, "")
    c = Math.sqrt(normalized.size).ceil.to_i
    r = Math.sqrt(normalized.size).floor.to_i
    r += 1 if r * c < normalized.size
    padded = normalized.ljust(r * c, ' ')

    if padded.empty?
      ""
    else
      padded
        .chars.each_slice(c).to_a
        .transpose
        .map(&.join).join(' ')
    end
  end
end
