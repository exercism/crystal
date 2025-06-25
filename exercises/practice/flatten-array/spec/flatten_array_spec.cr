require "spec"
require "../src/*"

describe "FlattenArray" do
  it "empty" do
    FlattenArray.flatten([] of Int32 | Nil).should eq([] of Int32)
  end

  pending "no nesting" do
    FlattenArray.flatten([0, 1, 2]).should eq([0, 1, 2])
  end

  pending "flattens a nested array" do
    FlattenArray.flatten(Array(Array(Int32)).new).should eq([] of Int32)
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

  pending "null values are omitted from the final result" do
    FlattenArray.flatten([1, 2, nil]).should eq([1, 2])
  end

  pending "consecutive null values at the front of the array are omitted from the final result" do
    FlattenArray.flatten([nil, nil, 3]).should eq([3])
  end

  pending "consecutive null values in the middle of the array are omitted from the final result" do
    FlattenArray.flatten([1, nil, nil, 4]).should eq([1, 4])
  end

  pending "6 level nested array with null values" do
    FlattenArray.flatten([0, 2, [[2, 3], 8, [[100]], nil, [[nil]]], -2]).should eq([0, 2, 2, 3, 8, 100, -2])
  end

  pending "all values in nested array are null" do
    FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]).should eq([] of Int32)
  end
end
