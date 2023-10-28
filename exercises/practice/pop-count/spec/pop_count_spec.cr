require "spec"
require "../src/*"

describe "PopCount" do
  it "0 eggs" do
    PopCount.egg_count(0).should eq(0)
  end

  pending "1 egg" do
    PopCount.egg_count(16).should eq(1)
  end

  pending "4 eggs" do
    PopCount.egg_count(89).should eq(4)
  end

  pending "13 eggs" do
    PopCount.egg_count(2000000000).should eq(13)
  end
end
