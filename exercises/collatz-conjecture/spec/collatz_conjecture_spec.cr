require "spec"
require "../src/*"

describe "CollatzConjecture" do
  it "zero steps for one" do
    CollatzConjecture.steps(1).should eq(0)
  end

  pending "divide if even" do
    CollatzConjecture.steps(16).should eq(4)
  end

  pending "even and odd steps" do
    CollatzConjecture.steps(12).should eq(9)
  end

  pending "large number of even and odd steps" do
    CollatzConjecture.steps(1000000).should eq(152)
  end

  pending "zero is an error" do
    expect_raises(ArgumentError) do
      CollatzConjecture.steps(0)
    end
  end

  pending "negative value is an error" do
    expect_raises(ArgumentError) do
      CollatzConjecture.steps(-15)
    end
  end
end
