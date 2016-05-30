require "spec"
require "./leap"

struct Time
  def leap_year?
    raise "That's too easy! Implement this method in your own way!"
  end
end

describe "Leap" do
  describe "#leap?" do
    it "marks 1996 as a leap year" do
      Year.leap?(1996).should be_true
    end

    pending "marks 1997 not as a leap year" do
      Year.leap?(1997).should be_false
    end

    pending "marks 1998 not as a leap year" do
      Year.leap?(1998).should be_false
    end

    pending "marks 1900 not as a leap year" do
      Year.leap?(1900).should be_false
    end

    pending "marks 2400 as a leap year" do
      Year.leap?(2400).should be_true
    end

    pending "marks 2000 as a leap year" do
      Year.leap?(2000).should be_true
    end
  end
end
