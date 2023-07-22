require "spec"
require "../src/*"

describe "BookStore" do
  it "Only a single book" do
    total = BookStore.total([1])
    total.should eq(800)
  end

  pending "Two of the same book" do
    total = BookStore.total([2, 2])
    total.should eq(1600)
  end

  pending "Empty basket" do
    total = BookStore.total([] of Int32)
    total.should eq(0)
  end

  pending "Two different books" do
    total = BookStore.total([1, 2])
    total.should eq(1520)
  end

  pending "Three different books" do
    total = BookStore.total([1, 2, 3])
    total.should eq(2160)
  end

  pending "Four different books" do
    total = BookStore.total([1, 2, 3, 4])
    total.should eq(2560)
  end

  pending "Five different books" do
    total = BookStore.total([1, 2, 3, 4, 5])
    total.should eq(3000)
  end

  pending "Two groups of four is cheaper than group of five plus group of three" do
    total = BookStore.total([1, 1, 2, 2, 3, 3, 4, 5])
    total.should eq(5120)
  end

  pending "Two groups of four is cheaper than groups of five and three" do
    total = BookStore.total([1, 1, 2, 3, 4, 4, 5, 5])
    total.should eq(5120)
  end

  pending "Group of four plus group of two is cheaper than two groups of three" do
    total = BookStore.total([1, 1, 2, 2, 3, 4])
    total.should eq(4080)
  end

  pending "Two each of first four books and one copy each of rest" do
    total = BookStore.total([1, 1, 2, 2, 3, 3, 4, 4, 5])
    total.should eq(5560)
  end

  pending "Two copies of each book" do
    total = BookStore.total([1, 1, 2, 2, 3, 3, 4, 4, 5, 5])
    total.should eq(6000)
  end

  pending "Three copies of first book and two each of remaining" do
    total = BookStore.total([1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1])
    total.should eq(6800)
  end

  pending "Three each of first two books and two each of remaining books" do
    total = BookStore.total([1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2])
    total.should eq(7520)
  end

  pending "Four groups of four are cheaper than two groups each of five and three" do
    total = BookStore.total([1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5])
    total.should eq(10240)
  end

  pending "Check that groups of four are created properly even when there are more groups of three than groups of five" do
    total = BookStore.total([1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5])
    total.should eq(14560)
  end

  pending "One group of one and four is cheaper than one group of two and three" do
    total = BookStore.total([1, 1, 2, 3, 4])
    total.should eq(3360)
  end

  pending "One group of one and two plus three groups of four is cheaper than one group of each size" do
    total = BookStore.total([1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5])
    total.should eq(10000)
  end
end
