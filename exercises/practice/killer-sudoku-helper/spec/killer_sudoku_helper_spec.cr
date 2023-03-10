require "spec"
require "../src/*"

describe "KillerSudokuHelper" do
  it "1" do
    killer_sudoku_helper = Combinations.new(1, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[1]]
  end

  pending "2" do
    killer_sudoku_helper = Combinations.new(2, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[2]]
  end

  pending "3" do
    killer_sudoku_helper = Combinations.new(3, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[3]]
  end

  pending "4" do
    killer_sudoku_helper = Combinations.new(4, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[4]]
  end

  pending "5" do
    killer_sudoku_helper = Combinations.new(5, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[5]]
  end

  pending "6" do
    killer_sudoku_helper = Combinations.new(6, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[6]]
  end

  pending "7" do
    killer_sudoku_helper = Combinations.new(7, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[7]]
  end

  pending "8" do
    killer_sudoku_helper = Combinations.new(8, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[8]]
  end

  pending "9" do
    killer_sudoku_helper = Combinations.new(9, 1, [] of Int32)
    killer_sudoku_helper.solve.should eq [[9]]
  end

  pending "Cage with sum 45 contains all digits 1:9" do
    killer_sudoku_helper = Combinations.new(45, 9, [] of Int32)
    killer_sudoku_helper.solve.should eq [[1, 2, 3, 4, 5, 6, 7, 8, 9]]
  end

  pending "Cage with only 1 possible combination" do
    killer_sudoku_helper = Combinations.new(7, 3, [] of Int32)
    killer_sudoku_helper.solve.should eq [[1, 2, 4]]
  end

  pending "Cage with several combinations" do
    killer_sudoku_helper = Combinations.new(10, 2, [] of Int32)
    killer_sudoku_helper.solve.should eq [[1, 9], [2, 8], [3, 7], [4, 6]]
  end

  pending "Cage with several combinations that is restricted" do
    killer_sudoku_helper = Combinations.new(10, 2, [1, 4] of Int32)
    killer_sudoku_helper.solve.should eq [[2, 8], [3, 7]]
  end
end
