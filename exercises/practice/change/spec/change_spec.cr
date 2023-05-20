require "spec"
require "../src/*"

describe "Change" do
  it "change for 1 cent" do
    Change.find_fewest_coins(target: 1, coins: [1, 5, 10, 25])
      .should eq [1]
  end

  pending "single coin change" do
    Change.find_fewest_coins(target: 25, coins: [1, 5, 10, 25, 100])
      .should eq [25]
  end

  pending "multiple coin change" do
    Change.find_fewest_coins(target: 15, coins: [1, 5, 10, 25, 100])
      .should eq [5, 10]
  end

  pending "change with Lilliputian Coins" do
    Change.find_fewest_coins(target: 23, coins: [1, 4, 15, 20, 50])
      .should eq [4, 4, 15]
  end

  pending "change with Lower Elbonia Coins" do
    Change.find_fewest_coins(target: 63, coins: [1, 5, 10, 21, 25])
      .should eq [21, 21, 21]
  end

  pending "large target values" do
    Change.find_fewest_coins(target: 999, coins: [1, 2, 5, 10, 20, 50, 100])
      .should eq [2, 2, 5, 20, 20, 50, 100, 100, 100, 100, 100, 100, 100, 100, 100]
  end

  pending "possible change without unit coins available" do
    Change.find_fewest_coins(target: 21, coins: [2, 5, 10, 20, 50])
      .should eq [2, 2, 2, 5, 10]
  end

  pending "another possible change without unit coins available" do
    Change.find_fewest_coins(target: 27, coins: [4, 5])
      .should eq [4, 4, 4, 5, 5, 5]
  end

  pending "no coins make 0 change" do
    Change.find_fewest_coins(target: 0, coins: [1, 5, 10, 21, 25])
      .should eq [] of Int32
  end

  pending "error testing for change smaller than the smallest of coins" do
    expect_raises(ArgumentError) do
      Change.find_fewest_coins(target: 3, coins: [5, 10])
    end
  end

  pending "error if no combination can add up to target" do
    expect_raises(ArgumentError) do
      Change.find_fewest_coins(target: 94, coins: [5, 10])
    end
  end

  pending "cannot find negative change values" do
    expect_raises(ArgumentError) do
      Change.find_fewest_coins(target: -5, coins: [1, 2, 5])
    end
  end
end
