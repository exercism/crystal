require "spec"
require "../src/*"

describe "Luhn" do
  it "single digit strings can not be valid" do
    Luhn.valid?("1").should eq(false)
  end

  pending "a single zero is invalid" do
    Luhn.valid?("0").should eq(false)
  end

  pending "a simple valid SIN that remains valid if reversed" do
    Luhn.valid?("059").should eq(true)
  end

  pending "a simple valid SIN that becomes invalid if reversed" do
    Luhn.valid?("59").should eq(true)
  end

  pending "a valid Canadian SIN" do
    Luhn.valid?("055 444 285").should eq(true)
  end

  pending "invalid Canadian SIN" do
    Luhn.valid?("055 444 286").should eq(false)
  end

  pending "invalid credit card" do
    Luhn.valid?("8273 1232 7352 0569").should eq(false)
  end

  pending "valid number with an even number of digits" do
    Luhn.valid?("095 245 88").should eq(true)
  end

  pending "valid strings with a non-digit added at the end become invalid" do
    Luhn.valid?("059a").should eq(false)
  end

  pending "valid strings with punctuation included become invalid" do
    Luhn.valid?("055-444-285").should eq(false)
  end

  pending "valid strings with symbols included become invalid" do
    Luhn.valid?("055£ 444$ 285").should eq(false)
  end

  pending "single zero with space is invalid" do
    Luhn.valid?(" 0").should eq(false)
  end

  pending "more than a single zero is valid" do
    Luhn.valid?("0000 0").should eq(true)
  end

  pending "input digit 9 is correctly converted to output digit 9" do
    Luhn.valid?("091").should eq(true)
  end

  pending "using ascii value for non-doubled non-digit isn't allowed" do
    Luhn.valid?("055b 444 285").should eq(false)
  end

  pending "using ascii value for doubled non-digit isn't allowed" do
    Luhn.valid?(":9").should eq(false)
  end
end
