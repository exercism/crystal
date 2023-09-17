module Yacht
  enum Category
    Ones
    Twos
    Threes
    Fours
    Fives
    Sixes
    FullHouse
    FourOfAKind
    LittleStraight
    BigStraight
    Choice
    Yacht
  end

  def self.score(dice, category)
    case category
    when Category::Ones
      dice.count(1) * 1
    when Category::Twos
      dice.count(2) * 2
    when Category::Threes
      dice.count(3) * 3
    when Category::Fours
      dice.count(4) * 4
    when Category::Fives
      dice.count(5) * 5
    when Category::Sixes
      dice.count(6) * 6
    when Category::FullHouse
      dice.uniq.map { |v| dice.count(v) }.sort == [2, 3] ? dice.sum : 0
    when Category::FourOfAKind
      dice.uniq.select { |v| dice.count(v) >= 4 }.sum * 4
    when Category::LittleStraight
      dice.sort == [1, 2, 3, 4, 5] ? 30 : 0
    when Category::BigStraight
      dice.sort == [2, 3, 4, 5, 6] ? 30 : 0
    when Category::Choice
      dice.sum
    when Category::Yacht
      dice.uniq.size == 1 ? 50 : 0
    end
  end
end
