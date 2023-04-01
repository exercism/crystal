require "spec"
require "../src/*"

describe "Say" do
  it "zero" do
    Say.number(0).should eq("zero")
  end

  pending "one" do
    Say.number(1).should eq("one")
  end

  pending "fourteen" do
    Say.number(14).should eq("fourteen")
  end

  pending "twenty" do
    Say.number(20).should eq("twenty")
  end

  pending "twenty-two" do
    Say.number(22).should eq("twenty-two")
  end

  pending "thirty" do
    Say.number(30).should eq("thirty")
  end

  pending "ninety-nine" do
    Say.number(99).should eq("ninety-nine")
  end

  pending "one hundred" do
    Say.number(100).should eq("one hundred")
  end

  pending "one hundred twenty-three" do
    Say.number(123).should eq("one hundred twenty-three")
  end

  pending "two hundred" do
    Say.number(200).should eq("two hundred")
  end

  pending "nine hundred ninety-nine" do
    Say.number(999).should eq("nine hundred ninety-nine")
  end

  pending "one thousand" do
    Say.number(1000).should eq("one thousand")
  end

  pending "one thousand two hundred thirty-four" do
    Say.number(1234).should eq("one thousand two hundred thirty-four")
  end

  pending "one million" do
    Say.number(1000000).should eq("one million")
  end

  pending "one million two thousand three hundred forty-five" do
    Say.number(1002345).should eq("one million two thousand three hundred forty-five")
  end

  pending "one billion" do
    Say.number(1000000000).should eq("one billion")
  end

  pending "a big number" do
    Say.number(987654321123).should eq("nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three")
  end

  pending "numbers below zero are out of range" do
    expect_raises(ArgumentError) do
      Say.number(-1)
    end
  end

  pending "numbers above 999,999,999,999 are out of range" do
    expect_raises(ArgumentError) do
      Say.number(1000000000000)
    end
  end
end
