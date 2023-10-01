require "spec"
require "../src/*"

describe Chess do
  describe "Files & Ranks" do
    it "should have 8 files" do
      Chess::FILES.should eq 'A'..'H'
    end

    it "should have 8 ranks" do
      Chess::RANKS.should eq 1..8
    end
  end

  describe "valid_square?" do
    it "should return true when given a valid square" do
      Chess.valid_square?(1, 'A').should be_true
    end

    it "should return true for another valid square" do
      Chess.valid_square?(8, 'H').should be_true
    end

    it "should return false when rank is out of range" do
      Chess.valid_square?(9, 'B').should be_false
    end

    it "should return false when file is out of range" do
      Chess.valid_square?(1, 'I').should be_false
    end

    it "should return false when rank is less than one" do
      Chess.valid_square?(0, 'A').should be_false
    end
  end

  describe "nickname" do
    it "Should return correct player nickname" do
      Chess.nickname("John", "Doe").should eq "JOOE"
    end

    it "Should give correct nickname for 2 letter last name" do
      Chess.nickname("Lisa", "Li").should eq "LILI"
    end

    it "Should give correct nickname for 2 letter first name" do
      Chess.nickname("Dj", "Walker").should eq "DJER"
    end
  end

  describe "move_message" do
    it "should return correct message for a move" do
      Chess.move_message("John", "Doe", "A2").should eq "JOOE moved to A2"
    end

    it "should return correct message when moving to corner" do
      Chess.move_message("Lisa", "Li", "H8").should eq "LILI moved to H8"
    end

    it "should return incorrect message when out of board" do
      Chess.move_message("Dj", "Walker", "I9").should eq "DJER attempted to move to I9, but that is not a valid square"
    end

    it "should return incorrect message when being on rank 0" do
      Chess.move_message("Tore", "Anderson", "A0").should eq "TOON attempted to move to A0, but that is not a valid square"
    end
  end
end
