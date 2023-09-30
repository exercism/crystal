require "spec"
require "../src/*"

describe "SpiralMatrix" do
  it "empty spiral" do
    SpiralMatrix.spiral_matrix(0).should eq([] of Int32)
  end

  pending "trivial spiral" do
    SpiralMatrix.spiral_matrix(1).should eq([
      [1],
    ])
  end

  pending "spiral of size 2" do
    SpiralMatrix.spiral_matrix(2).should eq([
      [1, 2],
      [4, 3],
    ])
  end

  pending "spiral of size 3" do
    SpiralMatrix.spiral_matrix(3).should eq([
      [1, 2, 3],
      [8, 9, 4],
      [7, 6, 5],
    ])
  end

  pending "spiral of size 4" do
    SpiralMatrix.spiral_matrix(4).should eq([
      [1, 2, 3, 4],
      [12, 13, 14, 5],
      [11, 16, 15, 6],
      [10, 9, 8, 7],
    ])
  end

  pending "spiral of size 5" do
    SpiralMatrix.spiral_matrix(5).should eq([
      [1, 2, 3, 4, 5],
      [16, 17, 18, 19, 6],
      [15, 24, 25, 20, 7],
      [14, 23, 22, 21, 8],
      [13, 12, 11, 10, 9],
    ])
  end
end
