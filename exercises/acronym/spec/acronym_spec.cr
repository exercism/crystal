require "spec"
require "../src/*"

describe "Acronym" do
  it "tests basic" do
    Acronym.abbreviate("Portable Network Graphics").should eq("PNG")
  end

  it "tests lowercase words" do
    Acronym.abbreviate("Ruby on Rails").should eq("ROR")
  end

  it "tests camelcase" do
    Acronym.abbreviate("HyperText Markup Language").should eq("HTML")
  end

  it "tests punctuation" do
    Acronym.abbreviate("First In, First Out").should eq("FIFO")
  end

  it "tests all caps words" do
    Acronym.abbreviate("PHP: Hypertext Preprocessor").should eq("PHP")
  end

  it "tests non-acronym all caps word" do
    Acronym.abbreviate("GNU Image Manipulation Program").should eq("GIMP")
  end

  it "tests hyphenated" do
    Acronym.abbreviate("Complementary metal-oxide semiconductor").should eq("CMOS")
  end
end
