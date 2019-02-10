require "spec"
require "../src/*"

describe "SpaceAge" do
  it "age on Earth" do
    SpaceAge.age("Earth", 1000000000).should eq(31.69)
  end

  pending "age on Mercury" do
    SpaceAge.age("Mercury", 2134835688).should eq(280.88)
  end

  pending "age on Venus" do
    SpaceAge.age("Venus", 189839836).should eq(9.78)
  end

  pending "age on Mars" do
    SpaceAge.age("Mars", 2129871239).should eq(35.88)
  end

  pending "age on Jupiter" do
    SpaceAge.age("Jupiter", 901876382).should eq(2.41)
  end

  pending "age on Saturn" do
    SpaceAge.age("Saturn", 2000000000).should eq(2.15)
  end

  pending "age on Uranus" do
    SpaceAge.age("Uranus", 1210123456).should eq(0.46)
  end

  pending "age on Neptune" do
    SpaceAge.age("Neptune", 1821023456).should eq(0.35)
  end
end
