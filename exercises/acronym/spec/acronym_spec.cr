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

  pending "does all caps word" do
    Acronym.abbreviate("GNU Image Manipulation Program").should eq("GIMP")
  end

  pending "does punctuation without whitespace" do
    Acronym.abbreviate("Complementary metal-oxide semiconductor").should eq("CMOS")
  end
end
