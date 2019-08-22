require "spec"
require "../src/*"

describe "Luhn" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "single digit strings can not be valid" do
    Luhn.valid?("1").should eq(false)
  end

  {{pending.id}} "a single zero is invalid" do
    Luhn.valid?("0").should eq(false)
  end

  {{pending.id}} "a simple valid SIN that remains valid if reversed" do
    Luhn.valid?("059").should eq(true)
  end

  {{pending.id}} "a simple valid SIN that becomes invalid if reversed" do
    Luhn.valid?("59").should eq(true)
  end

  {{pending.id}} "a valid Canadian SIN" do
    Luhn.valid?("055 444 285").should eq(true)
  end

  {{pending.id}} "invalid Canadian SIN" do
    Luhn.valid?("055 444 286").should eq(false)
  end

  {{pending.id}} "invalid credit card" do
    Luhn.valid?("8273 1232 7352 0569").should eq(false)
  end

  {{pending.id}} "valid number with an even number of digits" do
    Luhn.valid?("095 245 88").should eq(true)
  end

  {{pending.id}} "valid number with an odd number of spaces" do
    Luhn.valid?("234 567 891 234").should eq(true)
  end

  {{pending.id}} "valid strings with a non-digit added at the end become invalid" do
    Luhn.valid?("059a").should eq(false)
  end

  {{pending.id}} "valid strings with punctuation included become invalid" do
    Luhn.valid?("055-444-285").should eq(false)
  end

  {{pending.id}} "valid strings with symbols included become invalid" do
    Luhn.valid?("055# 444$ 285").should eq(false)
  end

  {{pending.id}} "single zero with space is invalid" do
    Luhn.valid?(" 0").should eq(false)
  end

  {{pending.id}} "more than a single zero is valid" do
    Luhn.valid?("0000 0").should eq(true)
  end

  {{pending.id}} "input digit 9 is correctly converted to output digit 9" do
    Luhn.valid?("091").should eq(true)
  end

  {{pending.id}} "using ascii value for non-doubled non-digit isn't allowed" do
    Luhn.valid?("055b 444 285").should eq(false)
  end

  {{pending.id}} "using ascii value for doubled non-digit isn't allowed" do
    Luhn.valid?(":9").should eq(false)
  end
  {% end %}
end
