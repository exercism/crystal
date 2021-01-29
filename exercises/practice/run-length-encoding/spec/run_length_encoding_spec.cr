require "spec"
require "../src/*"

describe "RunLengthEncoding" do
  it "encode empty string" do
    RunLengthEncoding.encode("").should eq("")
  end

  pending "encode single characters only are encoded without count" do
    RunLengthEncoding.encode("XYZ").should eq("XYZ")
  end

  pending "encode string with no single characters" do
    RunLengthEncoding.encode("AABBBCCCC").should eq("2A3B4C")
  end

  pending "encode single characters mixed with repeated characters" do
    RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB").should eq("12WB12W3B24WB")
  end

  pending "encode multiple whitespace mixed in string" do
    RunLengthEncoding.encode("  hsqq qww  ").should eq("2 hs2q q2w2 ")
  end

  pending "encode lowercase characters" do
    RunLengthEncoding.encode("aabbbcccc").should eq("2a3b4c")
  end

  pending "decode empty string" do
    RunLengthEncoding.decode("").should eq("")
  end

  pending "decode single characters only" do
    RunLengthEncoding.decode("XYZ").should eq("XYZ")
  end

  pending "decode string with no single characters" do
    RunLengthEncoding.decode("2A3B4C").should eq("AABBBCCCC")
  end

  pending "decode single characters with repeated characters" do
    RunLengthEncoding.decode("12WB12W3B24WB").should eq("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
  end

  pending "decode multiple whitespace mixed in string" do
    RunLengthEncoding.decode("2 hs2q q2w2 ").should eq("  hsqq qww  ")
  end

  pending "decode lower case string" do
    RunLengthEncoding.decode("2a3b4c").should eq("aabbbcccc")
  end

  pending "encode followed by decode gives original string" do
    RunLengthEncoding.decode(RunLengthEncoding.encode("zzz ZZ  zZ")).should eq("zzz ZZ  zZ")
  end
end
