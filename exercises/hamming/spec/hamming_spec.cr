require "spec"
require "../src/*"

describe "Hamming" do
  describe "#compute" do
    it "computes no difference for identical single nucleotide strands" do
      Hamming.compute("A", "A").should eq 0
    end

    pending "computes a distance for single nucleotide strands" do
      Hamming.compute("A", "G").should eq 1
    end

    pending "computes a distance for small strands" do
      Hamming.compute("AG", "CT").should eq 2
    end

    pending "computes a distance for medium strands" do
      Hamming.compute("GGACG", "GGTCG").should eq 1
    end

    pending "computes a distance for large strands" do
      Hamming.compute("GGACGGATTCTG", "AGGACGGATTCT").should eq 9
    end

    pending "raises an exception when strands aren't of equal length" do
      expect_raises(ArgumentError) { Hamming.compute("GCC", "A") }
    end
  end
end
