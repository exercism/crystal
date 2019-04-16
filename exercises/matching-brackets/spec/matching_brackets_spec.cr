require "spec"
require "../src/*"

describe "Brackets" do
  describe "#are_valid?" do
    it "paired square brackets" do
      Brackets.are_valid?("[]").should be_true
    end

    pending "empty string" do
      Brackets.are_valid?("").should be_true
    end

    pending "unpaired brackets" do
      Brackets.are_valid?("[[").should be_false
    end

    pending "wrong ordered brackets" do
      Brackets.are_valid?("}{").should be_false
    end

    pending "paired with whitespace" do
      Brackets.are_valid?("{ }").should be_true
    end

    pending "simple nested brackets" do
      Brackets.are_valid?("{[]}").should be_true
    end

    pending "several paired brackets" do
      Brackets.are_valid?("{}[]").should be_true
    end

    pending "paired and nested brackets" do
      Brackets.are_valid?("([{}({}[])])").should be_true
    end

    pending "unopened closing brackets" do
      Brackets.are_valid?("{[)][]}").should be_false
    end

    pending "unpaired and nested brackets" do
      Brackets.are_valid?("([{])").should be_false
    end

    pending "paired and wrong nested brackets" do
      Brackets.are_valid?("[({]})").should be_false
    end

    pending "math expression" do
      Brackets.are_valid?("(((185 + 223.85) * 15) - 543)/2").should be_true
    end

    pending "complex latex expression" do
      Brackets.are_valid?("\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)").should be_true
    end
  end
end
