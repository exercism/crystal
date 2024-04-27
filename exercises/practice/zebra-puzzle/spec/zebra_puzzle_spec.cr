require "spec"
require "../src/*"

describe "ZebraPuzzle" do
  it "resident who drinks water" do
    puzzle = ZebraPuzzle.new
    puzzle.drinks_water.should eq("Norwegian")
  end

  pending "resident who owns zebra" do
    puzzle = ZebraPuzzle.new
    puzzle.owns_zebra.should eq("Japanese")
  end
end
