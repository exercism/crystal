require "spec"
require "../src/*"

describe "MatchingBrackets" do
  it "paired square brackets" do
    MatchingBrackets.valid?("[]").should eq(true)
  end

  pending "empty string" do
    MatchingBrackets.valid?("").should eq(true)
  end

  pending "unpaired brackets" do
    MatchingBrackets.valid?("[[").should eq(false)
  end

  pending "wrong ordered brackets" do
    MatchingBrackets.valid?("}{").should eq(false)
  end

  pending "wrong closing bracket" do
    MatchingBrackets.valid?("{]").should eq(false)
  end

  pending "paired with whitespace" do
    MatchingBrackets.valid?("{ }").should eq(true)
  end

  pending "partially paired brackets" do
    MatchingBrackets.valid?("{[])").should eq(false)
  end

  pending "simple nested brackets" do
    MatchingBrackets.valid?("{[]}").should eq(true)
  end

  pending "several paired brackets" do
    MatchingBrackets.valid?("{}[]").should eq(true)
  end

  pending "paired and nested brackets" do
    MatchingBrackets.valid?("([{}({}[])])").should eq(true)
  end

  pending "unopened closing brackets" do
    MatchingBrackets.valid?("{[)][]}").should eq(false)
  end

  pending "unpaired and nested brackets" do
    MatchingBrackets.valid?("([{])").should eq(false)
  end

  pending "paired and wrong nested brackets" do
    MatchingBrackets.valid?("[({]})").should eq(false)
  end

  pending "paired and incomplete brackets" do
    MatchingBrackets.valid?("{}[").should eq(false)
  end

  pending "too many closing brackets" do
    MatchingBrackets.valid?("[]]").should eq(false)
  end

  pending "math expression" do
    MatchingBrackets.valid?("(((185 + 223.85) * 15) - 543)/2").should eq(true)
  end

  pending "complex latex expression" do
    MatchingBrackets.valid?("\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)").should eq(true)
  end
end
