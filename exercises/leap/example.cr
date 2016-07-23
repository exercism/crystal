class Year
  def self.leap?(year : Int32)
    Year.new(year).leap?
  end

  def initialize(year : Int32)
    @year = year
  end

  def leap?
    divisible_by?(400) || divisible_by?(4) && !divisible_by?(100)
  end

  private def divisible_by?(number : Int32)
    @year % number == 0
  end
end
