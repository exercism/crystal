require "spec"
require "../src/*"

describe "OcrNumbers" do
  it "Recognizes 0" do
    rows = [
      " _ ",
      "| |",
      "|_|",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("0")
  end

  pending "Recognizes 1" do
    rows = [
      "   ",
      "  |",
      "  |",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("1")
  end

  pending "Unreadable but correctly sized inputs return ?" do
    rows = [
      "   ",
      "  _",
      "  |",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("?")
  end

  pending "Input with a number of lines that is not a multiple of four raises an error" do
    rows = [
      " _ ",
      "| |",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq({"error" => "Number of input lines is not a multiple of four"})
  end

  pending "Input with a number of columns that is not a multiple of three raises an error" do
    rows = [
      "    ",
      "   |",
      "   |",
      "    ",
    ]
    OcrNumbers.convert(rows).should eq({"error" => "Number of input columns is not a multiple of three"})
  end

  pending "Recognizes 110101100" do
    rows = [
      "       _     _        _  _ ",
      "  |  || |  || |  |  || || |",
      "  |  ||_|  ||_|  |  ||_||_|",
      "                           ",
    ]
    OcrNumbers.convert(rows).should eq("110101100")
  end

  pending "Garbled numbers in a string are replaced with ?" do
    rows = [
      "       _     _           _ ",
      "  |  || |  || |     || || |",
      "  |  | _|  ||_|  |  ||_||_|",
      "                           ",
    ]
    OcrNumbers.convert(rows).should eq("11?10?1?0")
  end

  pending "Recognizes 2" do
    rows = [
      " _ ",
      " _|",
      "|_ ",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("2")
  end

  pending "Recognizes 3" do
    rows = [
      " _ ",
      " _|",
      " _|",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("3")
  end

  pending "Recognizes 4" do
    rows = [
      "   ",
      "|_|",
      "  |",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("4")
  end

  pending "Recognizes 5" do
    rows = [
      " _ ",
      "|_ ",
      " _|",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("5")
  end

  pending "Recognizes 6" do
    rows = [
      " _ ",
      "|_ ",
      "|_|",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("6")
  end

  pending "Recognizes 7" do
    rows = [
      " _ ",
      "  |",
      "  |",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("7")
  end

  pending "Recognizes 8" do
    rows = [
      " _ ",
      "|_|",
      "|_|",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("8")
  end

  pending "Recognizes 9" do
    rows = [
      " _ ",
      "|_|",
      " _|",
      "   ",
    ]
    OcrNumbers.convert(rows).should eq("9")
  end

  pending "Recognizes string of decimal numbers" do
    rows = [
      "    _  _     _  _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|| |",
      "  ||_  _|  | _||_|  ||_| _||_|",
      "                              ",
    ]
    OcrNumbers.convert(rows).should eq("1234567890")
  end

  pending "Numbers separated by empty lines are recognized. Lines are joined by commas." do
    rows = [
      "    _  _ ",
      "  | _| _|",
      "  ||_  _|",
      "         ",
      "    _  _ ",
      "|_||_ |_ ",
      "  | _||_|",
      "         ",
      " _  _  _ ",
      "  ||_||_|",
      "  ||_| _|",
      "         ",
    ]
    OcrNumbers.convert(rows).should eq("123,456,789")
  end
end
