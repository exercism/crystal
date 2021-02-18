module Isogram
  extend self

  def isogram?(phrase : String) : Bool
    characters_lower = phrase.chars.select { |c| c.ascii_letter? }.map { |c| c.downcase }
    characters_lower.to_set.size == characters_lower.size
  end
end
