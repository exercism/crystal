class Acronym
  def self.abbreviate(phrase)
    phrase.scan(/[A-Z]+['a-z]*|['a-z]+/).map do |word|
      word[0][0].upcase
    end.join
  end
end
