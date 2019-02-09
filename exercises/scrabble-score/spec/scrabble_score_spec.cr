require "spec"
require "../src/*"

describe "ScrabbleScore" do
  it "lowercase letter" do
    ScrabbleScore.score("a").should eq(1)
  end

  pending "uppercase letter" do
    ScrabbleScore.score("A").should eq(1)
  end

  pending "valuable letter" do
    ScrabbleScore.score("f").should eq(4)
  end

  pending "short word" do
    ScrabbleScore.score("at").should eq(2)
  end

  pending "short, valuable word" do
    ScrabbleScore.score("zoo").should eq(12)
  end

  pending "medium word" do
    ScrabbleScore.score("street").should eq(6)
  end

  pending "medium, valuable word" do
    ScrabbleScore.score("quirky").should eq(22)
  end

  pending "long, mixed-case word" do
    ScrabbleScore.score("OxyphenButazone").should eq(41)
  end

  pending "english-like word" do
    ScrabbleScore.score("pinata").should eq(8)
  end

  pending "empty input" do
    ScrabbleScore.score("").should eq(0)
  end

  pending "entire alphabet available" do
    ScrabbleScore.score("abcdefghijklmnopqrstuvwxyz").should eq(87)
  end
end
