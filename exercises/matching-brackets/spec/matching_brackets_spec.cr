require "spec"
require "../src/*"

describe "MatchingBrackets" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "paired square brackets" do
    MatchingBrackets.valid?("[]").should eq(true)
  end

  {{pending.id}} "empty string" do
    MatchingBrackets.valid?("").should eq(true)
  end

  {{pending.id}} "unpaired brackets" do
    MatchingBrackets.valid?("[[").should eq(false)
  end

  {{pending.id}} "wrong ordered brackets" do
    MatchingBrackets.valid?("}{").should eq(false)
  end

  {{pending.id}} "wrong closing bracket" do
    MatchingBrackets.valid?("{]").should eq(false)
  end

  {{pending.id}} "paired with whitespace" do
    MatchingBrackets.valid?("{ }").should eq(true)
  end

  {{pending.id}} "partially paired brackets" do
    MatchingBrackets.valid?("{[])").should eq(false)
  end

  {{pending.id}} "simple nested brackets" do
    MatchingBrackets.valid?("{[]}").should eq(true)
  end

  {{pending.id}} "several paired brackets" do
    MatchingBrackets.valid?("{}[]").should eq(true)
  end

  {{pending.id}} "paired and nested brackets" do
    MatchingBrackets.valid?("([{}({}[])])").should eq(true)
  end

  {{pending.id}} "unopened closing brackets" do
    MatchingBrackets.valid?("{[)][]}").should eq(false)
  end

  {{pending.id}} "unpaired and nested brackets" do
    MatchingBrackets.valid?("([{])").should eq(false)
  end

  {{pending.id}} "paired and wrong nested brackets" do
    MatchingBrackets.valid?("[({]})").should eq(false)
  end

  {{pending.id}} "paired and incomplete brackets" do
    MatchingBrackets.valid?("{}[").should eq(false)
  end

  {{pending.id}} "too many closing brackets" do
    MatchingBrackets.valid?("[]]").should eq(false)
  end

  {{pending.id}} "math expression" do
    MatchingBrackets.valid?("(((185 + 223.85) * 15) - 543)/2").should eq(true)
  end

  {{pending.id}} "complex latex expression" do
    MatchingBrackets.valid?("\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)").should eq(true)
  end
  {% end %}
end
