require "spec"
require "../src/*"

describe "PascalsTriangle" do
  it "will return the first 0 row(s)" do
    PascalsTriangle.rows(0).should eq([] of Int32)
  end

  pending "will return the first 1 row(s)" do
    PascalsTriangle.rows(1).should eq([[1_i64]])
  end

  pending "will return the first 2 row(s)" do
    PascalsTriangle.rows(2).should eq([[1_i64], [1_i64, 1_i64]])
  end

  pending "will return the first 3 row(s)" do
    PascalsTriangle.rows(3).should eq([[1_i64], [1_i64, 1_i64], [1_i64, 2_i64, 1_i64]])
  end

  pending "will return the first 4 row(s)" do
    PascalsTriangle.rows(4).should eq([[1_i64], [1_i64, 1_i64], [1_i64, 2_i64, 1_i64], [1_i64, 3_i64, 3_i64, 1_i64]])
  end

  pending "will return the first 5 row(s)" do
    PascalsTriangle.rows(5).should eq([[1_i64], [1_i64, 1_i64], [1_i64, 2_i64, 1_i64], [1_i64, 3_i64, 3_i64, 1_i64], [1_i64, 4_i64, 6_i64, 4_i64, 1_i64]])
  end

  pending "will return the first 6 row(s)" do
    PascalsTriangle.rows(6).should eq([[1_i64], [1_i64, 1_i64], [1_i64, 2_i64, 1_i64], [1_i64, 3_i64, 3_i64, 1_i64], [1_i64, 4_i64, 6_i64, 4_i64, 1_i64], [1_i64, 5_i64, 10_i64, 10_i64, 5_i64, 1_i64]])
  end

  pending "will return the first 10 row(s)" do
    PascalsTriangle.rows(10).should eq([[1_i64], [1_i64, 1_i64], [1_i64, 2_i64, 1_i64], [1_i64, 3_i64, 3_i64, 1_i64], [1_i64, 4_i64, 6_i64, 4_i64, 1_i64], [1_i64, 5_i64, 10_i64, 10_i64, 5_i64, 1_i64], [1_i64, 6_i64, 15_i64, 20_i64, 15_i64, 6_i64, 1_i64], [1_i64, 7_i64, 21_i64, 35_i64, 35_i64, 21_i64, 7_i64, 1_i64], [1_i64, 8_i64, 28_i64, 56_i64, 70_i64, 56_i64, 28_i64, 8_i64, 1_i64], [1_i64, 9_i64, 36_i64, 84_i64, 126_i64, 126_i64, 84_i64, 36_i64, 9_i64, 1_i64]])
  end

  pending "will raise an Argument error for negative rows" do
    expect_raises(ArgumentError) do
      PascalsTriangle.rows(-1)
    end
  end
end
