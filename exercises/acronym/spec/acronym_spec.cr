require "spec"
require "../src/*"

describe "Acronym" do
  it "does basic" do
    Acronym.abbreviate("Portable Network Graphics").should eq("PNG")
  end

  pending "does lowercase words" do
    Acronym.abbreviate("Ruby on Rails").should eq("ROR")
  end

  pending "does punctuation" do
    Acronym.abbreviate("First In, First Out").should eq("FIFO")
  end

  pending "does all caps words" do
    Acronym.abbreviate("PHP: Hypertext Preprocessor").should eq("PHP")
  end

  pending "does non-acronym all caps word" do
    Acronym.abbreviate("GNU Image Manipulation Program").should eq("GIMP")
  end

  pending "does hyphenated" do
    Acronym.abbreviate("Complementary metal-oxide semiconductor").should eq("CMOS")
  end
end
