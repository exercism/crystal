require "spec"
require "../src/*"

describe "Raindrops" do
  describe "#drops" do
    it "converts 1 to 1" do
      Raindrops.drops(1).should eq "1"
    end

    pending "converts 3 to Pling" do
      Raindrops.drops(3).should eq "Pling"
    end

    pending "converts 5 to Plang" do
      Raindrops.drops(5).should eq "Plang"
    end

    pending "converts 7 to Plong" do
      Raindrops.drops(7).should eq "Plong"
    end

    pending "converts 35 to PlangPlong" do
      Raindrops.drops(35).should eq "PlangPlong"
    end

    pending "converts 52 to 52" do
      Raindrops.drops(52).should eq "52"
    end

    pending "converts 105 to PlingPlangPlong" do
      Raindrops.drops(105).should eq "PlingPlangPlong"
    end
  end
end
