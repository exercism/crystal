require "spec"
require "../src/*"

describe "LargestSeriesProduct" do
  it "finds the largest product if span equals length" do
    series = LargestSeriesProduct.new("29")
    series.largest_product(2).should eq(18)
  end

  pending "can find the largest product of 2 with numbers in order" do
    series = LargestSeriesProduct.new("0123456789")
    series.largest_product(2).should eq(72)
  end

  pending "can find the largest product of 2" do
    series = LargestSeriesProduct.new("576802143")
    series.largest_product(2).should eq(48)
  end

  pending "can find the largest product of 3 with numbers in order" do
    series = LargestSeriesProduct.new("0123456789")
    series.largest_product(3).should eq(504)
  end

  pending "can find the largest product of 3" do
    series = LargestSeriesProduct.new("1027839564")
    series.largest_product(3).should eq(270)
  end

  pending "can find the largest product of 5 with numbers in order" do
    series = LargestSeriesProduct.new("0123456789")
    series.largest_product(5).should eq(15120)
  end

  pending "can get the largest product of a big number" do
    series = LargestSeriesProduct.new("73167176531330624919225119674426574742355349194934")
    series.largest_product(6).should eq(23520)
  end

  pending "reports zero if the only digits are zero" do
    series = LargestSeriesProduct.new("0000")
    series.largest_product(2).should eq(0)
  end

  pending "reports zero if all spans include zero" do
    series = LargestSeriesProduct.new("99099")
    series.largest_product(3).should eq(0)
  end

  pending "rejects span longer than string length" do
    series = LargestSeriesProduct.new("123")
    expect_raises(ArgumentError) do
      series.largest_product(4)
    end
  end

  pending "rejects empty string and nonzero span" do
    series = LargestSeriesProduct.new("")
    expect_raises(ArgumentError) do
      series.largest_product(1)
    end
  end

  pending "rejects invalid character in digits" do
    expect_raises(ArgumentError) do
      series = LargestSeriesProduct.new("1234a5")
    end
  end

  pending "rejects negative span" do
    series = LargestSeriesProduct.new("12345")
    expect_raises(ArgumentError) do
      series.largest_product(-1)
    end
  end
end
