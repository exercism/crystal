require "spec"
require "../src/*"

describe "QueenAttack" do
  describe "Test creation of Queens with valid and invalid positions" do
    it "queen with a valid position" do
      Queen.new(2, 2)
    end

    pending "queen must have positive row" do
      expect_raises(ArgumentError) do
        Queen.new(-2, 2)
      end
    end

    pending "queen must have row on board" do
      expect_raises(ArgumentError) do
        Queen.new(8, 4)
      end
    end

    pending "queen must have positive column" do
      expect_raises(ArgumentError) do
        Queen.new(2, -2)
      end
    end

    pending "queen must have column on board" do
      expect_raises(ArgumentError) do
        Queen.new(4, 8)
      end
    end
  end

  describe "Test the ability of one queen to attack another" do
    pending "cannot attack" do
      Queen.new(2, 4).can_attack?(Queen.new(6, 6)).should eq false
    end

    pending "can attack on same row" do
      Queen.new(2, 4).can_attack?(Queen.new(2, 6)).should eq true
    end

    pending "can attack on same column" do
      Queen.new(4, 5).can_attack?(Queen.new(2, 5)).should eq true
    end

    pending "can attack on first diagonal" do
      Queen.new(2, 2).can_attack?(Queen.new(0, 4)).should eq true
    end

    pending "can attack on second diagonal" do
      Queen.new(2, 2).can_attack?(Queen.new(3, 1)).should eq true
    end

    pending "can attack on third diagonal" do
      Queen.new(2, 2).can_attack?(Queen.new(1, 1)).should eq true
    end

    pending "can attack on fourth diagonal" do
      Queen.new(1, 7).can_attack?(Queen.new(0, 6)).should eq true
    end

    pending "cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal" do
      Queen.new(4, 1).can_attack?(Queen.new(2, 5)).should eq false
    end
  end
end
