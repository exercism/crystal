require "spec"
require "../src/*"

describe "Yacht" do
  it "Yacht" do
    dice = [5, 5, 5, 5, 5]
    category = Yacht::Category::Yacht
    Yacht.score(dice, category).should eq(50)
  end

  pending "Not Yacht" do
    dice = [1, 3, 3, 2, 5]
    category = Yacht::Category::Yacht
    Yacht.score(dice, category).should eq(0)
  end

  pending "Ones" do
    dice = [1, 1, 1, 3, 5]
    category = Yacht::Category::Ones
    Yacht.score(dice, category).should eq(3)
  end

  pending "Ones, out of order" do
    dice = [3, 1, 1, 5, 1]
    category = Yacht::Category::Ones
    Yacht.score(dice, category).should eq(3)
  end

  pending "No ones" do
    dice = [4, 3, 6, 5, 5]
    category = Yacht::Category::Ones
    Yacht.score(dice, category).should eq(0)
  end

  pending "Twos" do
    dice = [2, 3, 4, 5, 6]
    category = Yacht::Category::Twos
    Yacht.score(dice, category).should eq(2)
  end

  pending "Fours" do
    dice = [1, 4, 1, 4, 1]
    category = Yacht::Category::Fours
    Yacht.score(dice, category).should eq(8)
  end

  pending "Yacht counted as threes" do
    dice = [3, 3, 3, 3, 3]
    category = Yacht::Category::Threes
    Yacht.score(dice, category).should eq(15)
  end

  pending "Fives" do
    dice = [1, 5, 3, 5, 3]
    category = Yacht::Category::Fives
    Yacht.score(dice, category).should eq(10)
  end

  pending "Sixes" do
    dice = [2, 3, 4, 5, 6]
    category = Yacht::Category::Sixes
    Yacht.score(dice, category).should eq(6)
  end

  pending "Full house two small, three big" do
    dice = [2, 2, 4, 4, 4]
    category = Yacht::Category::FullHouse
    Yacht.score(dice, category).should eq(16)
  end

  pending "Full house three small, two big" do
    dice = [5, 3, 3, 5, 3]
    category = Yacht::Category::FullHouse
    Yacht.score(dice, category).should eq(19)
  end

  pending "Four of a kind is not a full house" do
    dice = [1, 4, 4, 4, 4]
    category = Yacht::Category::FullHouse
    Yacht.score(dice, category).should eq(0)
  end

  pending "Yacht is not a full house" do
    dice = [2, 2, 2, 2, 2]
    category = Yacht::Category::FullHouse
    Yacht.score(dice, category).should eq(0)
  end

  pending "Four of a Kind" do
    dice = [6, 6, 4, 6, 6]
    category = Yacht::Category::FourOfAKind
    Yacht.score(dice, category).should eq(24)
  end

  pending "Yacht can be scored as Four of a Kind" do
    dice = [3, 3, 3, 3, 3]
    category = Yacht::Category::FourOfAKind
    Yacht.score(dice, category).should eq(12)
  end

  pending "Full house is not Four of a Kind" do
    dice = [3, 3, 3, 5, 5]
    category = Yacht::Category::FourOfAKind
    Yacht.score(dice, category).should eq(0)
  end

  pending "Little Straight" do
    dice = [3, 5, 4, 1, 2]
    category = Yacht::Category::LittleStraight
    Yacht.score(dice, category).should eq(30)
  end

  pending "Little Straight as Big Straight" do
    dice = [1, 2, 3, 4, 5]
    category = Yacht::Category::BigStraight
    Yacht.score(dice, category).should eq(0)
  end

  pending "Four in order but not a little straight" do
    dice = [1, 1, 2, 3, 4]
    category = Yacht::Category::LittleStraight
    Yacht.score(dice, category).should eq(0)
  end

  pending "No pairs but not a little straight" do
    dice = [1, 2, 3, 4, 6]
    category = Yacht::Category::LittleStraight
    Yacht.score(dice, category).should eq(0)
  end

  pending "Minimum is 1, maximum is 5, but not a little straight" do
    dice = [1, 1, 3, 4, 5]
    category = Yacht::Category::LittleStraight
    Yacht.score(dice, category).should eq(0)
  end

  pending "Big Straight" do
    dice = [4, 6, 2, 5, 3]
    category = Yacht::Category::BigStraight
    Yacht.score(dice, category).should eq(30)
  end

  pending "Big Straight as little straight" do
    dice = [6, 5, 4, 3, 2]
    category = Yacht::Category::LittleStraight
    Yacht.score(dice, category).should eq(0)
  end

  pending "No pairs but not a big straight" do
    dice = [6, 5, 4, 3, 1]
    category = Yacht::Category::BigStraight
    Yacht.score(dice, category).should eq(0)
  end

  pending "Choice" do
    dice = [3, 3, 5, 6, 6]
    category = Yacht::Category::Choice
    Yacht.score(dice, category).should eq(23)
  end

  pending "Yacht as choice" do
    dice = [2, 2, 2, 2, 2]
    category = Yacht::Category::Choice
    Yacht.score(dice, category).should eq(10)
  end
end
