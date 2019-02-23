require "spec"
require "../src/*"

describe "Hamming" do
  it "empty strands" do
    Hamming.distance("", "").should eq(0)
  end

  pending "single letter identical strands" do
    Hamming.distance("A", "A").should eq(0)
  end

  pending "single letter different strands" do
    Hamming.distance("G", "T").should eq(1)
  end

  pending "long identical strands" do
    Hamming.distance("GGACTGAAATCTG", "GGACTGAAATCTG").should eq(0)
  end

  pending "long different strands" do
    Hamming.distance("GGACGGATTCTG", "AGGACGGATTCT").should eq(9)
  end

  pending "disallow first strand longer" do
    expect_raises(ArgumentError) do
      Hamming.distance("AATG", "AAA")
    end
  end

  pending "disallow second strand longer" do
    expect_raises(ArgumentError) do
      Hamming.distance("ATA", "AGTG")
    end
  end

  pending "disallow left empty strand" do
    expect_raises(ArgumentError) do
      Hamming.distance("", "G")
    end
  end

  pending "disallow right empty strand" do
    expect_raises(ArgumentError) do
      Hamming.distance("G", "")
    end
  end
end
