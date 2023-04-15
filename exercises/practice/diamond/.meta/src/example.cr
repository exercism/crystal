module Diamond
  extend self

  def rows(letter : Char) : Array(String)
    diamond = [row(letter, letter)]
    ((letter.ord - 1)..('A'.ord)).step(-1).each do |i|
      row = row(letter, i.chr)
      diamond = [row] + diamond + [row]
    end
    diamond
  end

  private def row(letter : Char, current : Char)
    padding = offset(letter) - offset(current)

    row = [' '] * (offset(letter) * 2 + 1)
    row[padding] = current
    row[row.size - padding - 1] = current
    row.join
  end

  private def offset(letter : Char)
    letter.ord - 'A'.ord
  end
end
