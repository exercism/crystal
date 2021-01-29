require "spec"
require "../src/*"

describe "MatchingBrackets" do
  it "paired square brackets" do
    MatchingBrackets.valid?("[]").should eq(true)
  end

  it "empty string" do
    MatchingBrackets.valid?("").should eq(true)
  end

  it "unpaired brackets" do
    MatchingBrackets.valid?("[[").should eq(false)
  end

  it "wrong ordered brackets" do
    MatchingBrackets.valid?("}{").should eq(false)
  end

  it "wrong closing bracket" do
    MatchingBrackets.valid?("{]").should eq(false)
  end

  it "paired with whitespace" do
    MatchingBrackets.valid?("{ }").should eq(true)
  end

  it "partially paired brackets" do
    MatchingBrackets.valid?("{[])").should eq(false)
  end

  it "simple nested brackets" do
    MatchingBrackets.valid?("{[]}").should eq(true)
  end

  it "several paired brackets" do
    MatchingBrackets.valid?("{}[]").should eq(true)
  end

  it "paired and nested brackets" do
    MatchingBrackets.valid?("([{}({}[])])").should eq(true)
  end

  it "unopened closing brackets" do
    MatchingBrackets.valid?("{[)][]}").should eq(false)
  end

  it "unpaired and nested brackets" do
    MatchingBrackets.valid?("([{])").should eq(false)
  end

  it "paired and wrong nested brackets" do
    MatchingBrackets.valid?("[({]})").should eq(false)
  end

  it "paired and incomplete brackets" do
    MatchingBrackets.valid?("{}[").should eq(false)
  end

  it "too many closing brackets" do
    MatchingBrackets.valid?("[]]").should eq(false)
  end

  it "math expression" do
    MatchingBrackets.valid?("(((185 + 223.85) * 15) - 543)/2").should eq(true)
  end

  it "complex latex expression" do
    MatchingBrackets.valid?("\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)").should eq(true)
  end
end
