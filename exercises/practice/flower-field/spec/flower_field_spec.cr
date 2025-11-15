require "spec"
require "../src/*"

describe "FlowerField" do
  it "no rows" do
    flowerfield = FlowerField.new([] of String)
    flowerfield.annotate.should eq([] of String)
  end

  pending "no columns" do
    flowerfield = FlowerField.new([""] of String)
    flowerfield.annotate.should eq([""])
  end

  pending "no flowers" do
    flowerfield = FlowerField.new(["   ", "   ", "   "] of String)
    flowerfield.annotate.should eq(["   ", "   ", "   "])
  end

  pending "garden full of flowers" do
    flowerfield = FlowerField.new(["***", "***", "***"] of String)
    flowerfield.annotate.should eq(["***", "***", "***"])
  end

  pending "flower surrounded by spaces" do
    flowerfield = FlowerField.new(["   ", " * ", "   "] of String)
    flowerfield.annotate.should eq(["111", "1*1", "111"])
  end

  pending "space surrounded by flowers" do
    flowerfield = FlowerField.new(["***", "* *", "***"] of String)
    flowerfield.annotate.should eq(["***", "*8*", "***"])
  end

  pending "horizontal line" do
    flowerfield = FlowerField.new([" * * "] of String)
    flowerfield.annotate.should eq(["1*2*1"])
  end

  pending "horizontal line, flowers at edges" do
    flowerfield = FlowerField.new(["*   *"] of String)
    flowerfield.annotate.should eq(["*1 1*"])
  end

  pending "vertical line" do
    flowerfield = FlowerField.new([" ", "*", " ", "*", " "] of String)
    flowerfield.annotate.should eq(["1", "*", "2", "*", "1"])
  end

  pending "vertical line, flowers at edges" do
    flowerfield = FlowerField.new(["*", " ", " ", " ", "*"] of String)
    flowerfield.annotate.should eq(["*", "1", " ", "1", "*"])
  end

  pending "cross" do
    flowerfield = FlowerField.new(["  *  ", "  *  ", "*****", "  *  ", "  *  "] of String)
    flowerfield.annotate.should eq([" 2*2 ", "25*52", "*****", "25*52", " 2*2 "])
  end

  pending "large garden" do
    flowerfield = FlowerField.new([" *  * ", "  *   ", "    * ", "   * *", " *  * ", "      "] of String)
    flowerfield.annotate.should eq(["1*22*1", "12*322", " 123*2", "112*4*", "1*22*2", "111111"])
  end

  pending "multiple adjacent flowers" do
    flowerfield = FlowerField.new([" ** "] of String)
    flowerfield.annotate.should eq(["1**1"])
  end
end
