require "spec"
require "../src/*"

describe "Dominoes" do
  it "empty input = empty output" do
    Dominoes.can_chain([] of Array(Int32)).should eq(true)
  end

  pending "singleton input = singleton output" do
    Dominoes.can_chain([[1, 1]]).should eq(true)
  end

  pending "singleton that can't be chained" do
    Dominoes.can_chain([[1, 2]]).should eq(false)
  end

  pending "three elements" do
    Dominoes.can_chain([[1, 2], [3, 1], [2, 3]]).should eq(true)
  end

  pending "can reverse dominoes" do
    Dominoes.can_chain([[1, 2], [1, 3], [2, 3]]).should eq(true)
  end

  pending "can't be chained" do
    Dominoes.can_chain([[1, 2], [4, 1], [2, 3]]).should eq(false)
  end

  pending "disconnected - simple" do
    Dominoes.can_chain([[1, 1], [2, 2]]).should eq(false)
  end

  pending "disconnected - double loop" do
    Dominoes.can_chain([[1, 2], [2, 1], [3, 4], [4, 3]]).should eq(false)
  end

  pending "disconnected - single isolated" do
    Dominoes.can_chain([[1, 2], [2, 3], [3, 1], [4, 4]]).should eq(false)
  end

  pending "need backtrack" do
    Dominoes.can_chain([[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]).should eq(true)
  end

  pending "separate loops" do
    Dominoes.can_chain([[1, 2], [2, 3], [3, 1], [1, 1], [2, 2], [3, 3]]).should eq(true)
  end

  pending "nine elements" do
    Dominoes.can_chain([[1, 2], [5, 3], [3, 1], [1, 2], [2, 4], [1, 6], [2, 3], [3, 4], [5, 6]]).should eq(true)
  end

  pending "separate three-domino loops" do
    Dominoes.can_chain([[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [6, 4]]).should eq(false)
  end
end
