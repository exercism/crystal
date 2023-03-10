require "spec"
require "../src/*"

describe "Darts" do
  it "Missed target" do
    Darts.score(-9.0, 9.0).should eq(0)
  end

  pending "On the outer circle" do
    Darts.score(0.0, 10.0).should eq(1)
  end

  pending "On the middle circle" do
    Darts.score(-5.0, 0.0).should eq(5)
  end

  pending "On the inner circle" do
    Darts.score(0.0, -1.0).should eq(10)
  end

  pending "Exactly on center" do
    Darts.score(0.0, 0.0).should eq(10)
  end

  pending "Near the center" do
    Darts.score(-0.1, -0.1).should eq(10)
  end

  pending "Just within the inner circle" do
    Darts.score(0.7, 0.7).should eq(10)
  end

  pending "Just outside the inner circle" do
    Darts.score(0.8, -0.8).should eq(5)
  end

  pending "Just within the middle circle" do
    Darts.score(-3.5, 3.5).should eq(5)
  end

  pending "Just outside the middle circle" do
    Darts.score(-3.6, -3.6).should eq(1)
  end

  pending "Just within the outer circle" do
    Darts.score(-7.0, 7.0).should eq(1)
  end

  pending "Just outside the outer circle" do
    Darts.score(7.1, -7.1).should eq(0)
  end

  pending "Asymmetric position between the inner and middle circles" do
    Darts.score(0.5, -4.0).should eq(5)
  end
end
