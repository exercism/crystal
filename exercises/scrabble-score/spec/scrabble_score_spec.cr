require "spec"
require "../src/*"

describe "ScrabbleScore" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "lowercase letter" do
    ScrabbleScore.score("a").should eq(1)
  end

  {{pending.id}} "uppercase letter" do
    ScrabbleScore.score("A").should eq(1)
  end

  {{pending.id}} "valuable letter" do
    ScrabbleScore.score("f").should eq(4)
  end

  {{pending.id}} "short word" do
    ScrabbleScore.score("at").should eq(2)
  end

  {{pending.id}} "short, valuable word" do
    ScrabbleScore.score("zoo").should eq(12)
  end

  {{pending.id}} "medium word" do
    ScrabbleScore.score("street").should eq(6)
  end

  {{pending.id}} "medium, valuable word" do
    ScrabbleScore.score("quirky").should eq(22)
  end

  {{pending.id}} "long, mixed-case word" do
    ScrabbleScore.score("OxyphenButazone").should eq(41)
  end

  {{pending.id}} "english-like word" do
    ScrabbleScore.score("pinata").should eq(8)
  end

  {{pending.id}} "empty input" do
    ScrabbleScore.score("").should eq(0)
  end

  {{pending.id}} "entire alphabet available" do
    ScrabbleScore.score("abcdefghijklmnopqrstuvwxyz").should eq(87)
  end
  {% end %}
end
