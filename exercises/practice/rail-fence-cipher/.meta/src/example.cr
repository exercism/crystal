module RailFenceCipher
  def self.encode(rail_count, plaintext)
    ciphertext = Array.new(plaintext.size, ' ')
    correspondences(rail_count, plaintext.size).each_with_index do |p, c|
      ciphertext[c] = plaintext[p]
    end
    ciphertext.join
  end

  def self.decode(rail_count, ciphertext)
    plaintext = Array.new(ciphertext.size, ' ')
    correspondences(rail_count, ciphertext.size).each_with_index do |p, c|
      plaintext[p] = ciphertext[c]
    end
    plaintext.join
  end

  private def self.correspondences(rail_count, length)
    lines = (0...rail_count).map { [] of Int32 }
    sequence = rail_sequence(rail_count)
    (0...length).each { |c| lines[sequence.next.as(Int32)].push c }
    lines.flatten
  end

  private def self.rail_sequence(rail_count)
    up = (0...rail_count)
    down = up.skip(1).reverse.skip(1)
    (up.to_a + down.to_a).cycle
  end
end
