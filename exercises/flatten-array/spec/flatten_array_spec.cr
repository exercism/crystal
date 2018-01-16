require "spec"
require "../src/*"

describe "FlattenArray" do
  it "no nesting" do
    FlattenArray.flatten([0, 1, 2]).should eq([0, 1, 2])
  end

  pending "flattens array with just integers present" do
    FlattenArray.flatten([1, [2, 3, 4, 5, 6, 7], 8]).should eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  pending "5 level nesting" do
    FlattenArray.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2]).should eq([0, 2, 2, 3, 8, 100, 4, 50, -2])
  end

  pending "6 level nesting" do
    FlattenArray.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8]).should eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  pending "6 level nest list with null values" do
    FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2]).should eq([0, 2, 2, 3, 8, 100, -2])
  end

  pending "all values in nested list are null" do
    FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]).should eq([] of Nil)
  end
end
