class EliudsEggs
  def self.egg_count(number : Int32) : Int32
    count : Int32 = 0
    while number > 0
      count += (number & 1)
      number = number >> 1
    end
    count
  end
end
