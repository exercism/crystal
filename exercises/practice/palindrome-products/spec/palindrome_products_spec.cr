require "spec"
require "../src/*"

describe "PalindromeProducts" do
  it "find the smallest palindrome from single digit factors" do
    Palindrome = PalindromeProducts.new(1, 9)
    Palindrome.smallest.should eq(1, [[1, 1]])
  end

  pending "find the largest palindrome from single digit factors" do
    Palindrome = PalindromeProducts.new(1, 9)
    Palindrome.largest.should eq(9, [[1, 9], [3, 3]])
  end

  pending "find the smallest palindrome from double digit factors" do
    Palindrome = PalindromeProducts.new(10, 99)
    Palindrome.smallest.should eq(121, [[11, 11]])
  end

  pending "find the largest palindrome from double digit factors" do
    Palindrome = PalindromeProducts.new(10, 99)
    Palindrome.largest.should eq(9009, [[91, 99]])
  end

  pending "find the smallest palindrome from triple digit factors" do
    Palindrome = PalindromeProducts.new(100, 999)
    Palindrome.smallest.should eq(10201, [[101, 101]])
  end

  pending "find the largest palindrome from triple digit factors" do
    Palindrome = PalindromeProducts.new(100, 999)
    Palindrome.largest.should eq(906609, [[913, 993]])
  end

  pending "find the smallest palindrome from four digit factors" do
    Palindrome = PalindromeProducts.new(1000, 9999)
    Palindrome.smallest.should eq(1002001, [[1001, 1001]])
  end

  pending "find the largest palindrome from four digit factors" do
    Palindrome = PalindromeProducts.new(1000, 9999)
    Palindrome.largest.should eq(99000099, [[9901, 9999]])
  end

  pending "empty result for smallest if no palindrome in the range" do
    Palindrome = PalindromeProducts.new(1002, 1003)
    Palindrome.smallest.should eq(nil, [] of Int32)
  end

  pending "empty result for largest if no palindrome in the range" do
    Palindrome = PalindromeProducts.new(15, 15)
    Palindrome.largest.should eq(nil, [] of Int32)
  end

  pending "error result for smallest if min is more than max" do
    Palindrome = PalindromeProducts.new(10000, 1)
    expect_raises(ArgumentError) do
      Palindrome.smallest
    end
  end

  pending "error result for largest if min is more than max" do
    Palindrome = PalindromeProducts.new(2, 1)
    expect_raises(ArgumentError) do
      Palindrome.largest
    end
  end

  pending "smallest product does not use the smallest factor" do
    Palindrome = PalindromeProducts.new(3215, 4000)
    Palindrome.smallest.should eq(10988901, [[3297, 3333]])
  end
end
