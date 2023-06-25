require "spec"
require "../src/*"

describe "Alphametics" do
  it "puzzle with three letters" do
    puzzle = "I + BB == ILL"
    solution = {'I' => 1, 'B' => 9, 'L' => 0}
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "solution must have unique value for each letter" do
    puzzle = "A == B"
    solution = Hash(Char, Int32).new
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "leading zero solution is invalid" do
    puzzle = "ACA + DD == BD"
    solution = Hash(Char, Int32).new
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "puzzle with two digits final carry" do
    puzzle = "A + A + A + A + A + A + A + A + A + A + A + B == BCC"
    solution = {'A' => 9, 'B' => 1, 'C' => 0}
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "puzzle with four letters" do
    puzzle = "AS + A == MOM"
    solution = {'A' => 9, 'S' => 2, 'M' => 1, 'O' => 0}
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "puzzle with six letters" do
    puzzle = "NO + NO + TOO == LATE"
    solution = {'N' => 7, 'O' => 4, 'T' => 9, 'L' => 1, 'A' => 0, 'E' => 2}
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "puzzle with seven letters" do
    puzzle = "HE + SEES + THE == LIGHT"
    solution = {'E' => 4, 'G' => 2, 'H' => 5, 'I' => 0, 'L' => 1, 'S' => 9, 'T' => 7}
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "puzzle with eight letters" do
    puzzle = "SEND + MORE == MONEY"
    solution = {'S' => 9, 'E' => 5, 'N' => 6, 'D' => 7, 'M' => 1, 'O' => 0, 'R' => 8, 'Y' => 2}
    Alphametics.solve(puzzle).should eq(solution)
  end

  pending "puzzle with ten letters" do
    puzzle = "AND + A + STRONG + OFFENSE + AS + A + GOOD == DEFENSE"
    solution = {
      'A' => 5, 'D' => 3, 'E' => 4, 'F' => 7, 'G' => 8, 'N' => 0, 'O' => 2, 'R' => 1, 'S' => 6, 'T' => 9,
    }
    Alphametics.solve(puzzle).should eq(solution)
  end
end
