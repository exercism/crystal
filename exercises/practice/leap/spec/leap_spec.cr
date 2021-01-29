require "spec"
require "../src/*"

struct Time
  def leap_year?
    raise "That's too easy! Implement this method in your own way!"
  end
end

describe "Leap" do
  describe "#leap?" do
    it "year not divisible by 4 in common year" do
      Year.leap?(2015).should be_false
    end

    pending "year divisible by 2, not divisible by 4 in common year" do
      Year.leap?(1970).should be_false
    end

    pending "year divisible by 4, not divisible by 100 in leap year" do
      Year.leap?(1996).should be_true
    end

    pending "year divisible by 100, not divisible by 400 in common year" do
      Year.leap?(2100).should be_false
    end

    pending "year divisible by 400 in leap year" do
      Year.leap?(2000).should be_true
    end

    pending "year divisible by 200, not divisible by 400 in common year" do
      Year.leap?(1800).should be_false
    end
  end
end
