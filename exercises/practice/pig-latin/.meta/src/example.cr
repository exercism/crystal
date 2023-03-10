module PigLatin
  def self.translate(phrase : String) : String
    phrase
      .split
      .map { |word| translate_word(word) }
      .join " "
  end

  def self.translate_word(word : String) : String
    if starts_with_vowel_sound?(word)
      word + "ay"
    else
      consonant_cluster, rest = consonant_cluster_and_rest(word)
      rest + consonant_cluster + "ay"
    end
  end

  private def self.starts_with_vowel_sound?(word)
    word.match /\A([aeiou]|y[^aeiou]|xr)/
  end

  private def self.consonant_cluster_and_rest(word)
    word.scan(/\A([^aeiou]?qu|[^aeiou]+(?=y)|[^aeiou]+)(.*)/).first[1, 2]
  end
end
