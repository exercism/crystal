require "spec"
require "../src/*"

describe "IsbnVerifier" do
  it "valid isbn number" do
    IsbnVerifier.valid?("3-598-21508-8").should eq(true)
  end

  pending "invalid isbn check digit" do
    IsbnVerifier.valid?("3-598-21508-9").should eq(false)
  end

  pending "valid isbn number with a check digit of 10" do
    IsbnVerifier.valid?("3-598-21507-X").should eq(true)
  end

  pending "check digit is a character other than X" do
    IsbnVerifier.valid?("3-598-21507-A").should eq(false)
  end

  pending "invalid character in isbn" do
    IsbnVerifier.valid?("3-598-P1581-X").should eq(false)
  end

  pending "X is only valid as a check digit" do
    IsbnVerifier.valid?("3-598-2X507-9").should eq(false)
  end

  pending "valid isbn without separating dashes" do
    IsbnVerifier.valid?("3598215088").should eq(true)
  end

  pending "isbn without separating dashes and X as check digit" do
    IsbnVerifier.valid?("359821507X").should eq(true)
  end

  pending "isbn without check digit and dashes" do
    IsbnVerifier.valid?("359821507").should eq(false)
  end

  pending "too long isbn and no dashes" do
    IsbnVerifier.valid?("3598215078X").should eq(false)
  end

  pending "too short isbn" do
    IsbnVerifier.valid?("00").should eq(false)
  end

  pending "isbn without check digit" do
    IsbnVerifier.valid?("3-598-21507").should eq(false)
  end

  pending "check digit of X should not be used for 0" do
    IsbnVerifier.valid?("3-598-21515-X").should eq(false)
  end

  pending "empty isbn" do
    IsbnVerifier.valid?("").should eq(false)
  end

  pending "input is 9 characters" do
    IsbnVerifier.valid?("134456729").should eq(false)
  end

  pending "invalid characters are not ignored" do
    IsbnVerifier.valid?("3132P34035").should eq(false)
  end

  pending "input is too long but contains a valid isbn" do
    IsbnVerifier.valid?("98245726788").should eq(false)
  end
end
