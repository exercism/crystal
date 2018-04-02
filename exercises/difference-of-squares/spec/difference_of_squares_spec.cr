require "spec"
require "../src/*"

describe "DifferenceOfSquares" do
  it "calculates square of sum 5 is 225" do
    Squares.square_of_sum(5).should eq(225)
  end

  pending "calculates square of sum 10 is 3025" do
    Squares.square_of_sum(10).should eq(3025)
  end

  pending "calculates square of sum 100 is 25502500" do
    Squares.square_of_sum(100).should eq(25502500)
  end

  pending "calculates sum of squares 5 is 55" do
    Squares.sum_of_squares(5).should eq(55)
  end

  pending "calculates sum of squares 10 is 385" do
    Squares.sum_of_squares(10).should eq(385)
  end

  pending "calculates sum of squares 100 is 338350" do
    Squares.sum_of_squares(100).should eq(338350)
  end

  pending "calculates difference of squares 0 is 0" do
    Squares.difference_of_squares(0).should eq(0)
  end

  pending "calculates difference of squares 5 is 170" do
    Squares.difference_of_squares(5).should eq(170)
  end

  pending "calculates difference of squares 10 is 2640" do
    Squares.difference_of_squares(10).should eq(2640)
  end

  pending "calculates difference of squares 100 is 25164150" do
    Squares.difference_of_squares(100).should eq(25164150)
  end
end
