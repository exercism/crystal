require "spec"
require "../src/*"

describe "OcrNumbers" do
  it "Recognizes 0" do
    input = [
      " _ ",
      "| |",
      "|_|",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("0")
  end

  pending "Recognizes 1" do
    input = [
      "   ",
      "  |",
      "  |",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("1")
  end

  pending "Unreadable but correctly sized inputs return ?" do
    input = [
      "   ",
      "  _",
      "  |",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("?")
  end

  pending "Input with a number of lines that is not a multiple of four raises an error" do
    input = [
      " _ ",
      "| |",
      "   ",
    ]

    expect_raises(ArgumentError) do
      OcrNumbers.convert(input)
    end
  end

  pending "Input with a number of columns that is not a multiple of three raises an error" do
    input = [
      "    ",
      "   |",
      "   |",
      "    ",
    ]

    expect_raises(ArgumentError) do
      OcrNumbers.convert(input)
    end
  end

  pending "Recognizes 110101100" do
    input = [
      "       _     _        _  _ ",
      "  |  || |  || |  |  || || |",
      "  |  ||_|  ||_|  |  ||_||_|",
      "                           ",
    ]

    OcrNumbers.convert(input).should eq("110101100")
  end

  pending "Garbled numbers in a string are replaced with ?" do
    input = [
      "       _     _           _ ",
      "  |  || |  || |     || || |",
      "  |  | _|  ||_|  |  ||_||_|",
      "                           ",
    ]

    OcrNumbers.convert(input).should eq("11?10?1?0")
  end

  pending "Recognizes 2" do
    input = [
      " _ ",
      " _|",
      "|_ ",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("2")
  end

  pending "Recognizes 3" do
    input = [
      " _ ",
      " _|",
      " _|",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("3")
  end

  pending "Recognizes 4" do
    input = [
      "   ",
      "|_|",
      "  |",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("4")
  end

  pending "Recognizes 5" do
    input = [
      " _ ",
      "|_ ",
      " _|",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("5")
  end

  pending "Recognizes 6" do
    input = [
      " _ ",
      "|_ ",
      "|_|",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("6")
  end

  pending "Recognizes 7" do
    input = [
      " _ ",
      "  |",
      "  |",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("7")
  end

  pending "Recognizes 8" do
    input = [
      " _ ",
      "|_|",
      "|_|",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("8")
  end

  pending "Recognizes 9" do
    input = [
      " _ ",
      "|_|",
      " _|",
      "   ",
    ]

    OcrNumbers.convert(input).should eq("9")
  end

  pending "Recognizes string of decimal numbers" do
    input = [
      "    _  _     _  _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|| |",
      "  ||_  _|  | _||_|  ||_| _||_|",
      "                              ",
    ]

    OcrNumbers.convert(input).should eq("1234567890")
  end

  pending "Numbers separated by empty lines are recognized. Lines are joined by commas." do
    input = [
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

    OcrNumbers.convert(input).should eq("123,456,789")
  end
end
