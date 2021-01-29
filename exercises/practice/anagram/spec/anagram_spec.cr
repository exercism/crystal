require "spec"
require "../src/*"

describe "Anagram" do
  it "no matches" do
    Anagram.find("diaper", ["hello", "world", "zombies", "pants"]).should eq [] of String
  end

  pending "detects two anagrams" do
    Anagram.find("master", ["stream", "pigeon", "maters"]).should eq ["stream", "maters"]
  end

  pending "does not detect anagram subsets" do
    Anagram.find("good", ["dog", "goody"]).should eq [] of String
  end

  pending "detects anagram" do
    Anagram.find("listen", ["enlists", "google", "inlets", "banana"]).should eq ["inlets"]
  end

  pending "detects three anagrams" do
    Anagram.find("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]).should eq ["gallery", "regally", "largely"]
  end

  pending "does not detect non-anagrams with identical checksum" do
    Anagram.find("mass", ["last"]).should eq [] of String
  end

  pending "detects anagrams case-insensitively" do
    Anagram.find("Orchestra", ["cashregister", "Carthorse", "radishes"]).should eq ["Carthorse"]
  end

  pending "detects anagrams using case-insensitive subject" do
    Anagram.find("Orchestra", ["cashregister", "carthorse", "radishes"]).should eq ["carthorse"]
  end

  pending "detects anagrams using case-insensitive possible matches" do
    Anagram.find("orchestra", ["cashregister", "Carthorse", "radishes"]).should eq ["Carthorse"]
  end

  pending "does not detect an anagram if the original word is repeated" do
    Anagram.find("go", ["go Go GO"]).should eq [] of String
  end

  pending "anagrams must use all letters exactly once" do
    Anagram.find("tapper", ["patter"]).should eq [] of String
  end

  pending "words are not anagrams of themselves (case-insensitive)" do
    Anagram.find("BANANA", ["BANANA", "Banana", "banana"]).should eq [] of String
  end
end
