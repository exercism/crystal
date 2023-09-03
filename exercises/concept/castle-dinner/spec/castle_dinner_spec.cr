require "spec"
require "../src/*"

describe CastleDinner do
  describe "check_food?" do
    it "should return food if it is Mushroom pasties" do
      CastleDinner.check_food?("Mushroom pasties").should eq "Mushroom pasties"
    end

    it "should return nil for Cabbage chowder" do
      CastleDinner.check_food?("Cabbage chowder").should eq nil
    end

    it "should return nil for Roast venison" do
      CastleDinner.check_food?("Roast venison").should eq nil
    end
  end

  describe "check_drink?" do
    it "should return drink if it is Apple jucie" do
      CastleDinner.check_drink?("Apple juice").should eq "Apple juice"
    end

    it "should return drink if it is Elderberry juice" do
      CastleDinner.check_drink?("Elderberry juice").should eq "Elderberry juice"
    end

    it "should return nil for Water" do
      CastleDinner.check_drink?("Water").should eq nil
    end

    it "should return nil for Ale" do
      CastleDinner.check_drink?("Ale").should eq nil
    end

    it "should return drink if it starts with 'I'" do
      CastleDinner.check_drink?("Iced tea").should eq "Iced tea"
    end
  end

  describe "replace_drink" do
    it "shouldnt replace Elderberry juice" do
      CastleDinner.replace_drink("Elderberry juice").should eq "Elderberry juice"
    end

    it "should replace Water with Apple juice" do
      CastleDinner.replace_drink("Water").should eq "Apple juice"
    end

    it "should replace Ale with Apple Juice" do
      CastleDinner.replace_drink("Ale").should eq "Apple juice"
    end
  end
end
