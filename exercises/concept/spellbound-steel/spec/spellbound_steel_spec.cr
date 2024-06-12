require "../src/*"
require "spec"

describe "SpellboundSteel" do
  describe "find_card?" do
    it "should return the first warriors index" do
      deck = ["Warrior", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Warrior").should eq(0)
    end

    it "should return the first mages index" do
      deck = ["Warrior", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Mage").should eq(1)
    end

    it "should return nil if the card is not in the deck" do
      deck = ["Warrior", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Rogue").should eq(nil)
    end

    it "should work for different deck" do
      deck = ["Warrior", "Fireball", "Mage", "Warrior"]
      SpellboundSteel.find_card?(deck, "Mage").should eq(2)
    end
  end

  describe "capitalize_names" do
    it "should return an empty array if the input is empty" do
      SpellboundSteel.capitalize_names([] of String).should eq([] of String)
    end

    it "should capitalize the first letter of each word" do
      SpellboundSteel.capitalize_names(["warrior", "mage", "rogue"]).should eq(["Warrior", "Mage", "Rogue"])
    end

    it "should capitalize the first letter of each word" do
      SpellboundSteel.capitalize_names(["warrior", "mage", "rogue", "fireball", "ice storm", "lightning bolt"]).should eq(["Warrior", "Mage", "Rogue", "Fireball", "Ice Storm", "Lightning Bolt"])
    end
  end

  describe "calculate_power_level" do
    it "should return 0 if the deck is empty" do
      deck = [] of String
      SpellboundSteel.calculate_power_level(deck).should eq(0)
    end

    it "should return 10 if the deck has one Warrior" do
      deck = ["Warrior"]
      SpellboundSteel.calculate_power_level(deck).should eq(10)
    end

    it "should return 20 if the deck has one Mage" do
      deck = ["Mage"]
      SpellboundSteel.calculate_power_level(deck).should eq(20)
    end

    it "should return 30 if the deck has one Warrior and one mage" do
      deck = ["Warrior", "Mage"]
      SpellboundSteel.calculate_power_level(deck).should eq(30)
    end

    it "should return 35 if the deck has one Lightning Bolt" do
      deck = ["Lightning Bolt"]
      SpellboundSteel.calculate_power_level(deck).should eq(35)
    end

    it "should return 65 if the deck has a Rogue and Ice Storm " do
      deck = ["Rogue", "Ice Storm"]
      SpellboundSteel.calculate_power_level(deck).should eq(55)
    end

    it "should return 145 if all cards are in the deck" do
      deck = ["Warrior", "Mage", "Rogue", "Fireball", "Ice Storm", "Lightning Bolt"]
      SpellboundSteel.calculate_power_level(deck).should eq(135)
    end
  end

  describe "decode_characters" do
    it "should return an empty string if the input is empty" do
      SpellboundSteel.decode_characters("").should eq("")
    end

    it "should return warrior if the inut is wbalrrrlimoqr" do
      SpellboundSteel.decode_characters("wbalrrrlimoqr").should eq("warrior")
    end

    it "should return mage if the inut is mlabgle" do
      SpellboundSteel.decode_characters("mlabgle").should eq("mage")
    end

    it "should return rogue if the inut is rloguqgle" do
      SpellboundSteel.decode_characters("rloggquge").should eq("rogue")
    end
  end
end
