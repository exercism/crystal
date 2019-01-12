require "spec"
require "../src/*"

describe "ArmstrongNumbers" do
  it "Single digit numbers are Armstrong numbers" do
    ArmstrongNumbers.isArmstrongNumber(5).should eq(true)
  end

  pending "There are no 2 digit Armstrong numbers" do
    ArmstrongNumbers.isArmstrongNumber(10).should eq(false)
  end

  pending "Three digit number that is an Armstrong number" do
    ArmstrongNumbers.isArmstrongNumber(153).should eq(true)
  end

  pending "Three digit number that is not an Armstrong number" do
    ArmstrongNumbers.isArmstrongNumber(100).should eq(false)
  end

  pending "Four digit number that is an Armstrong number" do
    ArmstrongNumbers.isArmstrongNumber(9474).should eq(true)
  end

  pending "Four digit number that is not an Armstrong number" do
    ArmstrongNumbers.isArmstrongNumber(9475).should eq(false)
  end

  pending "Seven digit number that is an Armstrong number" do
    ArmstrongNumbers.isArmstrongNumber(9926315).should eq(true)
  end

  pending "Seven digit number that is not an Armstrong number" do
    ArmstrongNumbers.isArmstrongNumber(9926314).should eq(false)
  end
end
