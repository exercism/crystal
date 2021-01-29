require "spec"
require "../src/*"

describe "Isogram" do
  it "empty string" do
    Isogram.isogram?("").should eq(true)
  end

  pending "isogram with only lower case characters" do
    Isogram.isogram?("isogram").should eq(true)
  end

  pending "word with one duplicated character" do
    Isogram.isogram?("eleven").should eq(false)
  end

  pending "word with one duplicated character from the end of the alphabet" do
    Isogram.isogram?("zzyzx").should eq(false)
  end

  pending "longest reported english isogram" do
    Isogram.isogram?("subdermatoglyphic").should eq(true)
  end

  pending "word with duplicated character in mixed case" do
    Isogram.isogram?("Alphabet").should eq(false)
  end

  pending "word with duplicated character in mixed case, lowercase first" do
    Isogram.isogram?("alphAbet").should eq(false)
  end

  pending "hypothetical isogrammic word with hyphen" do
    Isogram.isogram?("thumbscrew-japingly").should eq(true)
  end

  pending "hypothetical word with duplicated character following hyphen" do
    Isogram.isogram?("thumbscrew-jappingly").should eq(false)
  end

  pending "isogram with duplicated hyphen" do
    Isogram.isogram?("six-year-old").should eq(true)
  end

  pending "made-up name that is an isogram" do
    Isogram.isogram?("Emily Jung Schwartzkopf").should eq(true)
  end

  pending "duplicated character in the middle" do
    Isogram.isogram?("accentor").should eq(false)
  end

  pending "same first and last characters" do
    Isogram.isogram?("angola").should eq(false)
  end
end
