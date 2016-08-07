require "spec"
require "./anagram"

describe "Anagram" do
  describe "#find" do
    it "has no matches with no anagrams" do
      Anagram.find("diaper", ["hello", "world", "zombies", "pants"]).should eq [] of String
    end

    pending "detects simple anagram" do
      Anagram.find("ant", ["tan", "stand", "at"]).should eq ["tan"]
    end

    pending "does not detect false positives" do
      Anagram.find("galea", ["eagle"]).should eq [] of String
    end

    pending "detects multiple anagrams" do
      Anagram.find("master", ["stream", "pigeon", "maters"]).should eq ["stream", "maters"]
    end

    pending "does not detect anagram subsets" do
      Anagram.find("good", ["dog", "goody"]).should eq [] of String
    end

    pending "detects anagram" do
      Anagram.find("listen", ["enlists", "google", "inlets", "banana"]).should eq ["inlets"]
    end

    pending "detects multiple anagrams" do
      Anagram.find("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]).should eq ["gallery", "regally", "largely"]
    end

    pending "does not detect identical words" do
      Anagram.find("corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]).should eq ["cron"]
    end

    pending "does not detect non-anagrams with identical checksum" do
      Anagram.find("mass", ["last"]).should eq [] of String
    end

    pending "detects anagrams case-insensitively" do
      Anagram.find("Orchestra", ["cashregister", "carthorse", "radishes"]).should eq ["carthorse"]
    end

    pending "detects anagrams using case-insensitive possible matches" do
      Anagram.find("orchestra", ["cashregister", "Carthorse", "radishes"]).should eq ["Carthorse"]
    end

    pending "does not detect a word as its own anagram" do
      Anagram.find("banana", ["Banana"]).should eq [] of String
    end

    pending "does not detect an anagram if the original word is repeated" do
      Anagram.find("go", ["go Go GO"]).should eq [] of String
    end

    pending "anagrams must use all letters exactly once" do
      Anagram.find("tapper", ["patter"]).should eq [] of String
    end

    pending "capital word is not own anagram" do
      Anagram.find("BANNANA", ["Banana"]).should eq [] of String
    end
  end
end
