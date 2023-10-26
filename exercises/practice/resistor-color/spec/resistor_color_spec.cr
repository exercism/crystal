require "spec"
require "../src/*"

describe ResistorColor do
  describe ".color_code" do
    it "finds the value for black" do
      ResistorColor.color_code("black").should eq(0)
    end

    pending "finds the value for white" do
      ResistorColor.color_code("white").should eq(9)
    end

    pending "finds the value for orange" do
      ResistorColor.color_code("orange").should eq(3)
    end

    pending "handles input that is not a recognised color" do
      ResistorColor.color_code("Puce").should be_nil
    end
  end

  describe ".colors" do
    pending "returns an array of known colors" do
      ResistorColor.colors.should eq(["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"])
    end
  end
end
