module Year
  def self.leap?(year : Number) : Bool
    year.divisible_by?(4) && (year.divisible_by?(400) || !year.divisible_by?(100))
  end
end
