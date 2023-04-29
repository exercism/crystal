require "spec"
require "../src/*"

describe "Matrix" do
  it "extract row from one number matrix" do
    matrix = Matrix.new("1")
    matrix.row(1).should eq([1])
  end

  pending "can extract row" do
    matrix = Matrix.new("1 2\n3 4")
    matrix.row(2).should eq([3, 4])
  end

  pending "extract row where numbers have different widths" do
    matrix = Matrix.new("1 2\n10 20")
    matrix.row(2).should eq([10, 20])
  end

  pending "can extract row from non-square matrix with no corresponding column" do
    matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9\n8 7 6")
    matrix.row(4).should eq([8, 7, 6])
  end

  pending "extract column from one number matrix" do
    matrix = Matrix.new("1")
    matrix.column(1).should eq([1])
  end

  pending "can extract column" do
    matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9")
    matrix.column(3).should eq([3, 6, 9])
  end

  pending "can extract column from non-square matrix with no corresponding row" do
    matrix = Matrix.new("1 2 3 4\n5 6 7 8\n9 8 7 6")
    matrix.column(4).should eq([4, 8, 6])
  end

  pending "extract column where numbers have different widths" do
    matrix = Matrix.new("89 1903 3\n18 3 1\n9 4 800")
    matrix.column(2).should eq([1903, 3, 4])
  end
end
