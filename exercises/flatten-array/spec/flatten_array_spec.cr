require "spec"
require "../src/*"

describe "FlattenArray" do
  it "no nesting" do
    FlattenArray.flatten([0_i64, 1_i64, 2_i64]).should eq([0_i64, 1_i64, 2_i64])
  end

  pending "flattens array with just integers present" do
    FlattenArray.flatten([1_i64, [2_i64, 3_i64, 4_i64, 5_i64, 6_i64, 7_i64], 8_i64]).should eq([1_i64, 2_i64, 3_i64, 4_i64, 5_i64, 6_i64, 7_i64, 8_i64])
  end

  pending "5 level nesting" do
    FlattenArray.flatten([0_i64, 2_i64, [[2_i64, 3_i64], 8_i64, 100_i64, 4_i64, [[[50_i64]]]], -2_i64]).should eq([0_i64, 2_i64, 2_i64, 3_i64, 8_i64, 100_i64, 4_i64, 50_i64, -2_i64])
  end

  pending "6 level nesting" do
    FlattenArray.flatten([1_i64, [2_i64, [[3_i64]], [4_i64, [[5_i64]]], 6_i64, 7_i64], 8_i64]).should eq([1_i64, 2_i64, 3_i64, 4_i64, 5_i64, 6_i64, 7_i64, 8_i64])
  end

  pending "6 level nest list with null values" do
    FlattenArray.flatten([0_i64, 2_i64, [[2_i64, 3_i64], 8_i64, [[100_i64]], nil, [[nil]]], -2_i64]).should eq([0_i64, 2_i64, 2_i64, 3_i64, 8_i64, 100_i64, -2_i64])
  end

  pending "all values in nested list are null" do
    FlattenArray.flatten([nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]).should eq([] of Nil)
  end
end
