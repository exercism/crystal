require "spec"
require "../src/*"

describe "Anagram" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "no matches" do
    Anagram.find("diaper", ["hello", "world", "zombies", "pants"]).should eq [] of String
  end

  {{pending.id}} "detects two anagrams" do
    Anagram.find("master", ["stream", "pigeon", "maters"]).should eq ["stream", "maters"]
  end

  {{pending.id}} "does not detect anagram subsets" do
    Anagram.find("good", ["dog", "goody"]).should eq [] of String
  end

  {{pending.id}} "detects anagram" do
    Anagram.find("listen", ["enlists", "google", "inlets", "banana"]).should eq ["inlets"]
  end

  {{pending.id}} "detects three anagrams" do
    Anagram.find("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]).should eq ["gallery", "regally", "largely"]
  end

  {{pending.id}} "detects multiple anagrams with different case" do
    Anagram.find("nose", ["Eons", "ONES"]).should eq ["Eons", "ONES"]
  end

  {{pending.id}} "does not detect non-anagrams with identical checksum" do
    Anagram.find("mass", ["last"]).should eq [] of String
  end

  {{pending.id}} "detects anagrams case-insensitively" do
    Anagram.find("Orchestra", ["cashregister", "Carthorse", "radishes"]).should eq ["Carthorse"]
  end

  {{pending.id}} "detects anagrams using case-insensitive subject" do
    Anagram.find("Orchestra", ["cashregister", "carthorse", "radishes"]).should eq ["carthorse"]
  end

  {{pending.id}} "detects anagrams using case-insensitive possible matches" do
    Anagram.find("orchestra", ["cashregister", "Carthorse", "radishes"]).should eq ["Carthorse"]
  end

  {{pending.id}} "does not detect an anagram if the original word is repeated" do
    Anagram.find("go", ["go Go GO"]).should eq [] of String
  end

  {{pending.id}} "anagrams must use all letters exactly once" do
    Anagram.find("tapper", ["patter"]).should eq [] of String
  end

  {{pending.id}} "words are not anagrams of themselves (case-insensitive)" do
    Anagram.find("BANANA", ["BANANA", "Banana", "banana"]).should eq [] of String
  end

  {{pending.id}} "words other than themselves can be anagrams" do
    Anagram.find("LISTEN", ["Listen", "Silent", "LISTEN"]).should eq ["Silent"]
  end
  {% end %}
end
