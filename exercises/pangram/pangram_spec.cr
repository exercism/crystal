require "spec"
require "./pangram"

describe "Pangram" do
  describe "#pangram?" do
    it "should reject an empty string" do
      str = ""
      Pangram.pangram?(str).should be_false
    end

    pending "should accept a pangram with only lower case" do
      str = "the quick brown fox jumps over the lazy dog"
      Pangram.pangram?(str).should be_true
    end

    pending "should reject a string missing character 'x'" do
      str = "a quick movement of the enemy will jeopardize five gunboats"
      Pangram.pangram?(str).should be_false
    end

    pending "should reject another string missing character 'x'" do
      str = "the quick brown fish jumps over the lazy dog"
      Pangram.pangram?(str).should be_false
    end

    pending "should accept a pangram with underscores" do
      str = "the_quick_brown_fox_jumps_over_the_lazy_dog"
      Pangram.pangram?(str).should be_true
    end

    pending "should accept a pangram with numbers" do
      str = "the 1 quick brown fox jumps over the 2 lazy dogs"
      Pangram.pangram?(str).should be_true
    end

    pending "should reject a string where missing letters replaced by numbers" do
      str = "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"
      Pangram.pangram?(str).should be_false
    end

    pending "should accept a pangram with mixed case and punctuation" do
      str = "\"Five quacking Zephyrs jolt my wax bed.\""
      Pangram.pangram?(str).should be_true
    end

    pending "should accept a pangram with non ascii characters" do
      str = "Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."
      Pangram.pangram?(str).should be_true
    end
  end
end
