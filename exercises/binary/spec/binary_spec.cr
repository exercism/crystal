require "spec"
require "../src/*"

describe "Binary" do
  it "binary 0 is decimal 0" do
    Binary.to_decimal("0").should eq(0)
  end

  pending "binary 1 is decimal 1" do
    Binary.to_decimal("1").should eq(1)
  end

  pending "binary 10 is decimal 2" do
    Binary.to_decimal("10").should eq(2)
  end

  pending "binary 11 is decimal 3" do
    Binary.to_decimal("11").should eq(3)
  end

  pending "binary 100 is decimal 4" do
    Binary.to_decimal("100").should eq(4)
  end

  pending "binary 1001 is decimal 9" do
    Binary.to_decimal("1001").should eq(9)
  end

  pending "binary 11010 is decimal 26" do
    Binary.to_decimal("11010").should eq(26)
  end

  pending "binary 10001101000 is decimal 1128" do
    Binary.to_decimal("10001101000").should eq(1128)
  end

  pending "binary ignores leading zeros" do
    Binary.to_decimal("000011111").should eq(31)
  end

  pending "2 is not a valid binary digit" do
    expect_raises(ArgumentError) do
      Binary.to_decimal("2")
    end
  end

  pending "a number containing a non-binary digit is invalid" do
    expect_raises(ArgumentError) do
      Binary.to_decimal("01201")
    end
  end

  pending "a number with trailing non-binary characters is invalid" do
    expect_raises(ArgumentError) do
      Binary.to_decimal("10nope")
    end
  end

  pending "a number with leading non-binary characters is invalid" do
    expect_raises(ArgumentError) do
      Binary.to_decimal("nope10")
    end
  end

  pending "a number with internal non-binary characters is invalid" do
    expect_raises(ArgumentError) do
      Binary.to_decimal("10nope10")
    end
  end

  pending "a number and a word whitespace separated is invalid" do
    expect_raises(ArgumentError) do
      Binary.to_decimal("001 nope")
    end
  end
end
