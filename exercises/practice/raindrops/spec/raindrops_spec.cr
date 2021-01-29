require "spec"
require "../src/*"

describe "Raindrops" do
  it "the sound for 1 is 1" do
    Raindrops.convert(1).should eq("1")
  end

  pending "the sound for 3 is Pling" do
    Raindrops.convert(3).should eq("Pling")
  end

  pending "the sound for 5 is Plang" do
    Raindrops.convert(5).should eq("Plang")
  end

  pending "the sound for 7 is Plong" do
    Raindrops.convert(7).should eq("Plong")
  end

  pending "the sound for 6 is Pling as it has a factor 3" do
    Raindrops.convert(6).should eq("Pling")
  end

  pending "2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base" do
    Raindrops.convert(8).should eq("8")
  end

  pending "the sound for 9 is Pling as it has a factor 3" do
    Raindrops.convert(9).should eq("Pling")
  end

  pending "the sound for 10 is Plang as it has a factor 5" do
    Raindrops.convert(10).should eq("Plang")
  end

  pending "the sound for 14 is Plong as it has a factor of 7" do
    Raindrops.convert(14).should eq("Plong")
  end

  pending "the sound for 15 is PlingPlang as it has factors 3 and 5" do
    Raindrops.convert(15).should eq("PlingPlang")
  end

  pending "the sound for 21 is PlingPlong as it has factors 3 and 7" do
    Raindrops.convert(21).should eq("PlingPlong")
  end

  pending "the sound for 25 is Plang as it has a factor 5" do
    Raindrops.convert(25).should eq("Plang")
  end

  pending "the sound for 27 is Pling as it has a factor 3" do
    Raindrops.convert(27).should eq("Pling")
  end

  pending "the sound for 35 is PlangPlong as it has factors 5 and 7" do
    Raindrops.convert(35).should eq("PlangPlong")
  end

  pending "the sound for 49 is Plong as it has a factor 7" do
    Raindrops.convert(49).should eq("Plong")
  end

  pending "the sound for 52 is 52" do
    Raindrops.convert(52).should eq("52")
  end

  pending "the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7" do
    Raindrops.convert(105).should eq("PlingPlangPlong")
  end

  pending "the sound for 3125 is Plang as it has a factor 5" do
    Raindrops.convert(3125).should eq("Plang")
  end
end
