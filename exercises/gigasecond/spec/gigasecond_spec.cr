require "spec"
require "../src/*"

describe "Gigasecond" do
  describe "#from" do
    it "finds gigsecond from 2011_04_25" do
      result = Gigasecond.from(Time.new(2011, 4, 25, 0, 0, 0))
      result.should eq Time.new(2043, 1, 1, 1, 46, 40)
    end

    pending "finds gigsecond from 1977_06_13" do
      result = Gigasecond.from(Time.new(1977, 6, 13, 0, 0, 0))
      result.should eq Time.new(2009, 2, 19, 1, 46, 40)
    end

    pending "finds gigsecond from 1959_07_19" do
      result = Gigasecond.from(Time.new(1959, 7, 19, 0, 0, 0))
      result.should eq Time.new(1991, 3, 27, 1, 46, 40)
    end

    pending "finds gigsecond with full_time specified" do
      result = Gigasecond.from(Time.new(2015, 1, 24, 22, 0, 0))
      result.should eq Time.new(2046, 10, 2, 23, 46, 40)
    end

    pending "finds gigsecond with full_time with day rollover" do
      result = Gigasecond.from(Time.new(2015, 1, 24, 23, 59, 59))
      result.should eq Time.new(2046, 10, 3, 1, 46, 39)
    end

    pending "test_with_your_birthday" do
    end
  end
end
