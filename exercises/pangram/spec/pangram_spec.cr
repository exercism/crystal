require "spec"
require "../src/*"

describe "Pangram" do
  it "sentence empty" do
    Pangram.pangram?("").should eq(false)
  end

  pending "recognizes a perfect lower case pangram" do
    Pangram.pangram?("abcdefghijklmnopqrstuvwxyz").should eq(true)
  end

  pending "pangram with only lower case" do
    Pangram.pangram?("the quick brown fox jumps over the lazy dog").should eq(true)
  end

  pending "missing character 'x'" do
    Pangram.pangram?("a quick movement of the enemy will jeopardize five gunboats").should eq(false)
  end

  pending "another missing character, e.g. 'h'" do
    Pangram.pangram?("five boxing wizards jump quickly at it").should eq(false)
  end

  pending "pangram with underscores" do
    Pangram.pangram?("the_quick_brown_fox_jumps_over_the_lazy_dog").should eq(true)
  end

  pending "pangram with numbers" do
    Pangram.pangram?("the 1 quick brown fox jumps over the 2 lazy dogs").should eq(true)
  end

  pending "missing letters replaced by numbers" do
    Pangram.pangram?("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog").should eq(false)
  end

  pending "pangram with mixed case and punctuation" do
    Pangram.pangram?("\"Five quacking Zephyrs jolt my wax bed.\"").should eq(true)
  end

  pending "upper and lower case versions of the same character should not be counted separately" do
    Pangram.pangram?("the quick brown fox jumps over with lazy FX").should eq(false)
  end
end
