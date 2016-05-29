class Year
  def self.is_leap?(year : Int32)
    Year.new(year).is_leap?
  end

  :private

  def initialize(year : Int32)
    @year = year
  end

  def is_leap?
    divisable_by?(400) || divisable_by?(4) && !divisable_by?(100)
  end

  def divisable_by?(number : Int32)
    @year % number == 0
  end
end
