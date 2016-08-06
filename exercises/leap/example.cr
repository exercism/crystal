module Year
  extend self

  def leap?(year)
    year.divisible_by?(400) || year.divisible_by?(4) && !year.divisible_by?(100)
  end
end
