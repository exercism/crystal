require "spec"
require "../src/*"

describe "LineUp" do
  it "format smallest non-exceptional ordinal numeral 4" do
    LineUp.format("Gianna", 4).should eq("Gianna, you are the 4th customer we serve today. Thank you!")
  end

  pending "format greatest single digit non-exceptional ordinal numeral 9" do
    LineUp.format("Maarten", 9).should eq("Maarten, you are the 9th customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 5" do
    LineUp.format("Petronila", 5).should eq("Petronila, you are the 5th customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 6" do
    LineUp.format("Attakullakulla", 6).should eq("Attakullakulla, you are the 6th customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 7" do
    LineUp.format("Kate", 7).should eq("Kate, you are the 7th customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 8" do
    LineUp.format("Maximiliano", 8).should eq("Maximiliano, you are the 8th customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 1" do
    LineUp.format("Mary", 1).should eq("Mary, you are the 1st customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 2" do
    LineUp.format("Haruto", 2).should eq("Haruto, you are the 2nd customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 3" do
    LineUp.format("Henriette", 3).should eq("Henriette, you are the 3rd customer we serve today. Thank you!")
  end

  pending "format smallest two digit non-exceptional ordinal numeral 10" do
    LineUp.format("Alvarez", 10).should eq("Alvarez, you are the 10th customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 11" do
    LineUp.format("Jacqueline", 11).should eq("Jacqueline, you are the 11th customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 12" do
    LineUp.format("Juan", 12).should eq("Juan, you are the 12th customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 13" do
    LineUp.format("Patricia", 13).should eq("Patricia, you are the 13th customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 21" do
    LineUp.format("Washi", 21).should eq("Washi, you are the 21st customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 62" do
    LineUp.format("Nayra", 62).should eq("Nayra, you are the 62nd customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 100" do
    LineUp.format("John", 100).should eq("John, you are the 100th customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 101" do
    LineUp.format("Zeinab", 101).should eq("Zeinab, you are the 101st customer we serve today. Thank you!")
  end

  pending "format non-exceptional ordinal numeral 112" do
    LineUp.format("Knud", 112).should eq("Knud, you are the 112th customer we serve today. Thank you!")
  end

  pending "format exceptional ordinal numeral 123" do
    LineUp.format("Yma", 123).should eq("Yma, you are the 123rd customer we serve today. Thank you!")
  end
end
