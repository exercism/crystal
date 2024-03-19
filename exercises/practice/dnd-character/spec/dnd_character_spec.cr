require "spec"
require "../src/*"

describe "DndCharacter" do
  describe "ability modifier" do
    it "ability modifier for score 3 is -4" do
      DndCharacter.modifier(3).should eq(-4)
    end

    pending "ability modifier for score 4 is -3" do
      DndCharacter.modifier(4).should eq(-3)
    end

    pending "ability modifier for score 5 is -3" do
      DndCharacter.modifier(5).should eq(-3)
    end

    pending "ability modifier for score 6 is -2" do
      DndCharacter.modifier(6).should eq(-2)
    end

    pending "ability modifier for score 7 is -2" do
      DndCharacter.modifier(7).should eq(-2)
    end

    pending "ability modifier for score 8 is -1" do
      DndCharacter.modifier(8).should eq(-1)
    end

    pending "ability modifier for score 9 is -1" do
      DndCharacter.modifier(9).should eq(-1)
    end

    pending "ability modifier for score 10 is 0" do
      DndCharacter.modifier(10).should eq(0)
    end

    pending "ability modifier for score 11 is 0" do
      DndCharacter.modifier(11).should eq(0)
    end

    pending "ability modifier for score 12 is +1" do
      DndCharacter.modifier(12).should eq(1)
    end

    pending "ability modifier for score 13 is +1" do
      DndCharacter.modifier(13).should eq(1)
    end

    pending "ability modifier for score 14 is +2" do
      DndCharacter.modifier(14).should eq(2)
    end

    pending "ability modifier for score 15 is +2" do
      DndCharacter.modifier(15).should eq(2)
    end

    pending "ability modifier for score 16 is +3" do
      DndCharacter.modifier(16).should eq(3)
    end

    pending "ability modifier for score 17 is +3" do
      DndCharacter.modifier(17).should eq(3)
    end

    pending "ability modifier for score 18 is +4" do
      DndCharacter.modifier(18).should eq(4)
    end
  end

  pending "random ability is within range" do
    DndCharacter.ability.should be >= 3
    DndCharacter.ability.should be <= 18
  end

  pending "random character is valid" do
    character = DndCharacter.new
    character.strength.should be >= 3
    character.strength.should be <= 18
    character.dexterity.should be >= 3
    character.dexterity.should be <= 18
    character.constitution.should be >= 3
    character.constitution.should be <= 18
    character.intelligence.should be >= 3
    character.intelligence.should be <= 18
    character.wisdom.should be >= 3
    character.wisdom.should be <= 18
    character.charisma.should be >= 3
    character.charisma.should be <= 18

    character.hitpoints.should eq(10 + DndCharacter.modifier(character.constitution))
  end

  pending "each ability is only calculated once" do
    character = DndCharacter.new
    character.strength.should eq character.strength
    character.dexterity.should eq character.dexterity
    character.constitution.should eq character.constitution
    character.intelligence.should eq character.intelligence
    character.wisdom.should eq character.wisdom
    character.charisma.should eq character.charisma
  end
end
