require "spec"
require "../src/*"

describe "Triangle" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "all sides are equal" do
    Triangle.new([2.0, 2.0, 2.0]).equilateral?.should eq(true)
  end

  {{pending.id}} "any side is unequal" do
    Triangle.new([2.0, 3.0, 2.0]).equilateral?.should eq(false)
  end

  {{pending.id}} "no sides are equal" do
    Triangle.new([5.0, 4.0, 6.0]).equilateral?.should eq(false)
  end

  {{pending.id}} "all zero sides is not a triangle" do
    Triangle.new([0.0, 0.0, 0.0]).equilateral?.should eq(false)
  end

  {{pending.id}} "sides may be floats" do
    Triangle.new([0.5, 0.5, 0.5]).equilateral?.should eq(true)
  end

  {{pending.id}} "last two sides are equal" do
    Triangle.new([3.0, 4.0, 4.0]).isosceles?.should eq(true)
  end

  {{pending.id}} "first two sides are equal" do
    Triangle.new([4.0, 4.0, 3.0]).isosceles?.should eq(true)
  end

  {{pending.id}} "first and last sides are equal" do
    Triangle.new([4.0, 3.0, 4.0]).isosceles?.should eq(true)
  end

  {{pending.id}} "equilateral triangles are also isosceles" do
    Triangle.new([4.0, 4.0, 4.0]).isosceles?.should eq(true)
  end

  {{pending.id}} "no sides are equal" do
    Triangle.new([2.0, 3.0, 4.0]).isosceles?.should eq(false)
  end

  {{pending.id}} "first triangle inequality violation" do
    Triangle.new([1.0, 1.0, 3.0]).isosceles?.should eq(false)
  end

  {{pending.id}} "second triangle inequality violation" do
    Triangle.new([1.0, 3.0, 1.0]).isosceles?.should eq(false)
  end

  {{pending.id}} "third triangle inequality violation" do
    Triangle.new([3.0, 1.0, 1.0]).isosceles?.should eq(false)
  end

  {{pending.id}} "sides may be floats" do
    Triangle.new([0.5, 0.4, 0.5]).isosceles?.should eq(true)
  end

  {{pending.id}} "no sides are equal" do
    Triangle.new([5.0, 4.0, 6.0]).scalene?.should eq(true)
  end

  {{pending.id}} "all sides are equal" do
    Triangle.new([4.0, 4.0, 4.0]).scalene?.should eq(false)
  end

  {{pending.id}} "two sides are equal" do
    Triangle.new([4.0, 4.0, 3.0]).scalene?.should eq(false)
  end

  {{pending.id}} "may not violate triangle inequality" do
    Triangle.new([7.0, 3.0, 2.0]).scalene?.should eq(false)
  end

  {{pending.id}} "sides may be floats" do
    Triangle.new([0.5, 0.4, 0.6]).scalene?.should eq(true)
  end
  {% end %}
end
