module Atbash
  MAPPING = (alp = ('a'..'z').to_a).zip(alp.reverse).to_h
  extend self

  def encode(message : String) : String
    message = sanitize_message(message)
    enarr = map_chars(message)
    add_spaces(enarr)
  end

  private def sanitize_message(message : String) : String
    message.downcase.gsub(/[^a-z0-9]/, "")
  end

  private def map_chars(message : String) : Array(Char)
    message.chars.map { |c| MAPPING[c]? || c }
  end

  private def add_spaces(chrs : Array(Char)) : String
    encoded_string = ""
    chrs.each_with_index do |c, i|
      encoded_string += ((i % 5 == 0 ? " " : "") + c)
    end
    encoded_string.strip
  end
end
