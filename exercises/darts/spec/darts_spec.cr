require "spec"
require "../src/*"

describe "Darts" do
  it "A dart lands outside the target" do
    Darts.score(-9.0, 9.0).should eq(0)
  end

  pending "A dart lands just in the border of the target" do
    Darts.score(0.0, 10.0).should eq(1)
  end

  pending "A dart lands in the outer circle" do
    Darts.score(4.0, 4.0).should eq(1)
  end

  pending "A dart lands right in the border between outer and middle circles" do
    Darts.score(5.0, 0.0).should eq(5)
  end

  pending "A dart lands in the middle circle" do
    Darts.score(0.8, -0.8).should eq(5)
  end

  pending "A dart lands right in the border between middle and inner circles" do
    Darts.score(0.0, -1.0).should eq(10)
  end

  pending "A dart lands in the inner circle" do
    Darts.score(-0.1, -0.1).should eq(10)
  end

  pending "A dart whose coordinates sum to > 1 but whose radius to origin is <= 1 is scored in the inner circle" do
    Darts.score(0.4, 0.8).should eq(10)
  end

  pending "A dart whose coordinates sum to > 5 but whose radius to origin is <= 5 is scored in the middle circle" do
    Darts.score(2.0, 4.0).should eq(5)
  end

  pending "A dart whose coordinates sum to > 10 but whose radius to origin is <= 10 is scored in the outer circle" do
    Darts.score(4.0, 8.0).should eq(1)
  end
end
