require "spec"
require "../src/*"

describe "ArmstrongNumbers" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "Zero is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(0).should eq(true)
  end

  {{pending.id}} "Single digit numbers are Armstrong numbers" do
    ArmstrongNumbers.armstrong_number?(5).should eq(true)
  end

  {{pending.id}} "There are no 2 digit Armstrong numbers" do
    ArmstrongNumbers.armstrong_number?(10).should eq(false)
  end

  {{pending.id}} "Three digit number that is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(153).should eq(true)
  end

  {{pending.id}} "Three digit number that is not an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(100).should eq(false)
  end

  {{pending.id}} "Four digit number that is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9474).should eq(true)
  end

  {{pending.id}} "Four digit number that is not an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9475).should eq(false)
  end

  {{pending.id}} "Seven digit number that is an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9926315).should eq(true)
  end

  {{pending.id}} "Seven digit number that is not an Armstrong number" do
    ArmstrongNumbers.armstrong_number?(9926314).should eq(false)
  end
  {% end %}
end
