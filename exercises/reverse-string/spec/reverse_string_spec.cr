require "spec"
require "../src/*"

describe "ReverseString" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "an empty string" do
    ReverseString.reverse("").should eq("")
  end

  {{pending.id}} "a word" do
    ReverseString.reverse("robot").should eq("tobor")
  end

  {{pending.id}} "a capitalized word" do
    ReverseString.reverse("Ramen").should eq("nemaR")
  end

  {{pending.id}} "a sentence with punctuation" do
    ReverseString.reverse("I'm hungry!").should eq("!yrgnuh m'I")
  end

  {{pending.id}} "a palindrome" do
    ReverseString.reverse("racecar").should eq("racecar")
  end

  {{pending.id}} "an even-sized word" do
    ReverseString.reverse("drawer").should eq("reward")
  end
  {% end %}
end
