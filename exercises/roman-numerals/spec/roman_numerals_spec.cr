require "spec"
require "../src/*"

describe "Int" do
  describe "#to_roman" do
    it "changes 1 to I" do
      1.to_roman.should eq "I"
    end
    pending "changes 2 to II" do
      2.to_roman.should eq "II"
    end
    pending "changes 3 to III" do
      3.to_roman.should eq "III"
    end
    pending "changes 4 to IV" do
      4.to_roman.should eq "IV"
    end
    pending "changes 5 to V" do
      5.to_roman.should eq "V"
    end
    pending "changes 6 to VI" do
      6.to_roman.should eq "VI"
    end
    pending "changes 9 to IX" do
      9.to_roman.should eq "IX"
    end
    pending "changes 27 to XXVII" do
      27.to_roman.should eq "XXVII"
    end
    pending "changes 48 to XLVIII" do
      48.to_roman.should eq "XLVIII"
    end
    pending "changes 59 to LIX" do
      59.to_roman.should eq "LIX"
    end
    pending "changes 93 to XCIII" do
      93.to_roman.should eq "XCIII"
    end
    pending "changes 141 to CXLI" do
      141.to_roman.should eq "CXLI"
    end
    pending "changes 163 to CLXIII" do
      163.to_roman.should eq "CLXIII"
    end
    pending "changes 402 to CDII" do
      402.to_roman.should eq "CDII"
    end
    pending "changes 575 to DLXXV" do
      575.to_roman.should eq "DLXXV"
    end
    pending "changes 911 to CMXI" do
      911.to_roman.should eq "CMXI"
    end
    pending "changes 1024 to MXXIV" do
      1024.to_roman.should eq "MXXIV"
    end
    pending "changes 3000 to MMM" do
      3000.to_roman.should eq "MMM"
    end
  end
end
