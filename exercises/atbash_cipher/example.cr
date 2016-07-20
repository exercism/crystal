module Atbash
  MAPPING = (alp = ('a'..'z').to_a).zip(alp.reverse).to_h
  extend self
  def encode(message : String) : String
    message = message.downcase.gsub(/[^a-z0-9]/, "")
    encoded_chars = message.chars.map{|c| MAPPING[c]? || c}
    encoded_string = ""
    encoded_chars.each_with_index do |c, i|
      encoded_string += ((i%5 == 0 ? " " : "") + c)
    end
    encoded_string.strip
  end
end
