require "spec"
require "../src/*"

describe "SaddlePoints" do
  it "Can identify single saddle point" do
    input = [[9, 8, 7], [5, 3, 2], [6, 6, 7]]
    expected = Set.new [{row: 2, column: 1}]
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify that empty matrix has no saddle points" do
    input = Array(Array(Int32)).new
    expected = Set.new [] of NamedTuple(row: Int32, column: Int32)
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify lack of saddle points when there are none" do
    input = [[1, 2, 3], [3, 1, 2], [2, 3, 1]]
    expected = Set.new [] of NamedTuple(row: Int32, column: Int32)
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify multiple saddle points in a column" do
    input = [[4, 5, 4], [3, 5, 5], [1, 5, 4]]
    expected = Set.new [{row: 1, column: 2}, {row: 2, column: 2}, {row: 3, column: 2}]
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify multiple saddle points in a row" do
    input = [[6, 7, 8], [5, 5, 5], [7, 5, 6]]
    expected = Set.new [{row: 2, column: 1}, {row: 2, column: 2}, {row: 2, column: 3}]
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify saddle point in bottom right corner" do
    input = [[8, 7, 9], [6, 7, 6], [3, 2, 5]]
    expected = Set.new [{row: 3, column: 3}]
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify saddle points in a non square matrix" do
    input = [[3, 1, 3], [3, 2, 4]]
    expected = Set.new [{row: 1, column: 3}, {row: 1, column: 1}]
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify that saddle points in a single column matrix are those with the minimum value" do
    input = [[2], [1], [4], [1]]
    expected = Set.new [{row: 2, column: 1}, {row: 4, column: 1}]
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end

  pending "Can identify that saddle points in a single row matrix are those with the maximum value" do
    input = [[2, 5, 3, 5]]
    expected = Set.new [{row: 1, column: 2}, {row: 1, column: 4}]
    actual = SaddlePoints.saddle_points(input)
    actual.should eq(expected.to_set)
  end
end
