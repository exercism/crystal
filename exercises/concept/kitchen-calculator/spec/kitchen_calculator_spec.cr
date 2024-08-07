require "spec"
require "../src/*"

describe KitchenCalculator do
  describe "get_volume" do
    it "get cups" do
      KitchenCalculator.get_volume({:cup, 1}).should eq(1)
    end

    it "get fluid ounces" do
      KitchenCalculator.get_volume({:fluid_ounce, 2}).should eq(2)
    end

    it "get teaspoons" do
      KitchenCalculator.get_volume({:teaspoon, 3}).should eq(3)
    end

    it "get tablespoons" do
      KitchenCalculator.get_volume({:tablespoon, 4}).should eq(4)
    end

    it "get milliliters" do
      KitchenCalculator.get_volume({:milliliter, 5}).should eq(5)
    end
  end

  describe "to_milliliter" do
    it "converts cups to milliliters" do
      KitchenCalculator.to_milliliter({:milliliter, 3}).should eq({:milliliter, 3})
    end

    it "cups" do
      KitchenCalculator.to_milliliter({:cup, 3}).should eq({:milliliter, 720})
    end

    it "fluid ounces" do
      KitchenCalculator.to_milliliter({:fluid_ounce, 100}).should eq({:milliliter, 3000})
    end

    it "teaspoons" do
      KitchenCalculator.to_milliliter({:teaspoon, 3}).should eq({:milliliter, 15})
    end

    it "tablespoons" do
      KitchenCalculator.to_milliliter({:tablespoon, 3}).should eq({:milliliter, 45})
    end
  end

  describe "from_milliliter" do
    it "milliliters" do
      KitchenCalculator.from_milliliter({:milliliter, 4}, :milliliter).should eq({:milliliter, 4})
    end

    it "cups" do
      KitchenCalculator.from_milliliter({:milliliter, 840}, :cup).should eq({:cup, 3.5})
    end

    it "fluid ounces" do
      KitchenCalculator.from_milliliter({:milliliter, 4522.5}, :fluid_ounce).should eq({:fluid_ounce, 150.75})
    end

    it "teaspoons" do
      KitchenCalculator.from_milliliter({:milliliter, 61.25}, :teaspoon).should eq({:teaspoon, 12.25})
    end

    it "tablespoons" do
      KitchenCalculator.from_milliliter({:milliliter, 71.25}, :tablespoon).should eq({:tablespoon, 4.75})
    end
  end

  describe "convert" do
    it "teaspoon to tablespoon" do
      KitchenCalculator.convert({:teaspoon, 15}, :tablespoon).should eq({:tablespoon, 5})
    end

    it "cups to fluid ounces" do
      KitchenCalculator.convert({:cup, 4}, :fluid_ounce).should eq({:fluid_ounce, 32})
    end

    it "fluid ounces to teaspoons" do
      KitchenCalculator.convert({:fluid_ounce, 4}, :teaspoon).should eq({:teaspoon, 24})
    end

    it "tablespoons to cups" do
      KitchenCalculator.convert({:tablespoon, 320}, :cup).should eq({:cup, 20})
    end
  end
end
