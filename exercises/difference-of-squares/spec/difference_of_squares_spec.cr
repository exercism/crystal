require "spec"
require "../src/*"

describe "DifferenceOfSquares" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "calculates square of sum 1 is 1" do
    Squares.square_of_sum(1).should eq(1)
  end

  {{pending.id}} "calculates square of sum 5 is 225" do
    Squares.square_of_sum(5).should eq(225)
  end

  {{pending.id}} "calculates square of sum 100 is 25502500" do
    Squares.square_of_sum(100).should eq(25502500)
  end

  {{pending.id}} "calculates sum of squares 1 is 1" do
    Squares.sum_of_squares(1).should eq(1)
  end

  {{pending.id}} "calculates sum of squares 5 is 55" do
    Squares.sum_of_squares(5).should eq(55)
  end

  {{pending.id}} "calculates sum of squares 100 is 338350" do
    Squares.sum_of_squares(100).should eq(338350)
  end

  {{pending.id}} "calculates difference of squares 1 is 0" do
    Squares.difference_of_squares(1).should eq(0)
  end

  {{pending.id}} "calculates difference of squares 5 is 170" do
    Squares.difference_of_squares(5).should eq(170)
  end

  {{pending.id}} "calculates difference of squares 100 is 25164150" do
    Squares.difference_of_squares(100).should eq(25164150)
  end
  {% end %}
end
