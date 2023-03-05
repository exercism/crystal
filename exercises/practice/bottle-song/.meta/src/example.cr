module BottleSong
  def self.recite(start_bottles : Int32, take_down : Int32)
    (start_bottles..(start_bottles - take_down + 1))
      .step(-1)
      .map { |n| [""] + verse(n) }
      .flatten
      .skip(1)
      .to_a
  end

  private def self.verse(n)
    [
      "#{say(n).capitalize} green #{bottles(n)} hanging on the wall,",
      "#{say(n).capitalize} green #{bottles(n)} hanging on the wall,",
      "And if #{say(1)} green #{bottles(1)} should accidentally fall,",
      "There'll be #{say(n - 1)} green #{bottles(n - 1)} hanging on the wall.",
    ]
  end

  private def self.bottles(n)
    "bottle" + (n == 1 ? "" : "s")
  end

  private def self.say(n)
    [
      "no", "one", "two", "three", "four", "five",
      "six", "seven", "eight", "nine", "ten",
    ][n]
  end
end
