require "spec"
require "../src/*"

describe "PythagoreanTriplet" do
  it "triplets whose sum is 12" do
    PythagoreanTriplet.triplets_with_sum(12).should eq([[3, 4, 5]])
  end

  pending "triplets whose sum is 108" do
    PythagoreanTriplet.triplets_with_sum(108).should eq([[27, 36, 45]])
  end

  pending "triplets whose sum is 1000" do
    PythagoreanTriplet.triplets_with_sum(1000).should eq([[200, 375, 425]])
  end

  pending "no matching triplets for 1001" do
    PythagoreanTriplet.triplets_with_sum(1001).should eq([] of Array(Int32))
  end

  pending "returns all matching triplets" do
    PythagoreanTriplet.triplets_with_sum(90).should eq([[9, 40, 41], [15, 36, 39]])
  end

  pending "several matching triplets" do
    PythagoreanTriplet.triplets_with_sum(840).should eq([[40, 399, 401], [56, 390, 394], [105, 360, 375], [120, 350, 370], [140, 336, 364], [168, 315, 357], [210, 280, 350], [240, 252, 348]])
  end

  pending "triplets for large number" do
    PythagoreanTriplet.triplets_with_sum(30000).should eq([[1200, 14375, 14425], [1875, 14000, 14125], [5000, 12000, 13000], [6000, 11250, 12750], [7500, 10000, 12500]])
  end
end
