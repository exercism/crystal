require "spec"
require "./bracket_push"

describe "Brackets" do
  describe "#are_valid?" do
    it "paired square brackets" do
      Brackets.are_valid?("[]").should be_true
    end
    it "empty string" do
      Brackets.are_valid?("").should be_true
    end
    it "unpaired brackets" do
      Brackets.are_valid?("[[").should be_false
    end
    it "wrong ordered brackets" do
      Brackets.are_valid?("}{").should be_false
    end
    it "paired with whitespace" do
      Brackets.are_valid?("{ }").should be_true
    end
    it "simple nested brackets" do
      Brackets.are_valid?("{[]}").should be_true
    end
    it "several paired brackets" do
      Brackets.are_valid?("{}[]").should be_true
    end
    it "paired and nested brackets" do
      Brackets.are_valid?("([{}({}[])])").should be_true
    end
    it "unopened closing brackets" do
      Brackets.are_valid?("{[)][]}").should be_false
    end
    it "unpaired and nested brackets" do
      Brackets.are_valid?("([{])").should be_false
    end
    it "paired and wrong nested brackets" do
      Brackets.are_valid?("[({]})").should be_false
    end
    it "math expression" do
      Brackets.are_valid?("(((185 + 223.85) * 15) - 543)/2").should be_true
    end
    it "complex latex expression" do
      Brackets.are_valid?("\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)").should be_true
    end
  end
end
