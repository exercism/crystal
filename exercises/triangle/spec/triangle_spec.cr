require "spec"
require "../src/*"

describe "Triangle" do
  it "true if all sides are equal" do
    Triangle.new([2, 2, 2]).equilateral?.should eq(true)
  end

  pending "false if any side is unequal" do
    Triangle.new([2, 3, 2]).equilateral?.should eq(false)
  end

  pending "false if no sides are equal" do
    Triangle.new([5, 4, 6]).equilateral?.should eq(false)
  end

  pending "All zero sides are illegal, so the triangle is not equilateral" do
    Triangle.new([0, 0, 0]).equilateral?.should eq(false)
  end

  pending "true if last two sides are equal" do
    Triangle.new([3, 4, 4]).isosceles?.should eq(true)
  end

  pending "true if first two sides are equal" do
    Triangle.new([4, 4, 3]).isosceles?.should eq(true)
  end

  pending "true if first and last sides are equal" do
    Triangle.new([4, 3, 4]).isosceles?.should eq(true)
  end

  pending "equilateral triangles are also isosceles" do
    Triangle.new([4, 4, 4]).isosceles?.should eq(true)
  end

  pending "false if no sides are equal" do
    Triangle.new([2, 3, 4]).isosceles?.should eq(false)
  end

  pending "Sides that violate triangle inequality are not isosceles, even if two are equal" do
    Triangle.new([1, 1, 3]).isosceles?.should eq(false)
  end

  pending "true if no sides are equal" do
    Triangle.new([5, 4, 6]).scalene?.should eq(true)
  end

  pending "false if all sides are equal" do
    Triangle.new([4, 4, 4]).scalene?.should eq(false)
  end

  pending "false if two sides are equal" do
    Triangle.new([4, 4, 3]).scalene?.should eq(false)
  end

  pending "Sides that violate triangle inequality are not scalene, even if they are all different" do
    Triangle.new([7, 3, 2]).scalene?.should eq(false)
  end
end
