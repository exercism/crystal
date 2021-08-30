module IsbnVerifier
  extend self

  def valid?(isbn : String) : Bool
    return false unless /\A\d-?\d{3}-?\d{5}-?[\dX]\z/.match(isbn)

    isbn_items = isbn.chars.select { |c| c.alphanumeric? }.map_with_index do |c, i|
      c == 'X' ? 10 : c.to_i * (10 - i)
    end

    isbn_items.sum(0) % 11 == 0
  end
end
