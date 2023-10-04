require "spec"
require "../src/*"

describe "Temperature" do
  describe "to_kelvin" do
    it "should convert 0 celsius to 273.15 Kelvin" do
      Temperature.new.to_kelvin(0).should eq 273.15
    end

    it "should convert -273.15 to 0 Kelvin" do
      Temperature.new.to_kelvin(-273.15).should eq 0
    end

    it "should convert -100 celsius to 173.15 Kelvin" do
      Temperature.new.to_kelvin(-100).should be_close 173.15, 0.001
    end

    it "should convert 100 celsius to 373.15 Kelvin" do
      Temperature.new.to_kelvin(100).should eq 373.15
    end
  end

  describe "round" do
    it "should convert 1.12 celsius to 1.1" do
      Temperature.new.round(1.12).should eq 1.1
    end

    it "should convert 1 celsius to 1" do
      Temperature.new.round(1).should eq 1
    end

    it "should convert -273.15 to -273.2" do
      Temperature.new.round(-273.15).should eq -273.2
    end

    it "should convert 1.1 celsius to 1.1" do
      Temperature.new.round(1.1).should eq 1.1
    end
  end

  describe "to_fahrenheit" do
    it "should convert 0 celsius to 32 fahrenheit" do
      Temperature.new.to_fahrenheit(0).should eq 32
    end

    it "should convert -273.15 to -459 fahrenheit" do
      Temperature.new.to_fahrenheit(-273.15).should eq -459
    end

    it "should convert -100 celsius to -148 fahrenheit" do
      Temperature.new.to_fahrenheit(-100).should eq -148
    end

    it "should convert 100 celsius to 212 fahrenheit" do
      Temperature.new.to_fahrenheit(100).should eq 212
    end
  end

  describe "number_missing_sensors" do
    it "should return 0 if there are no missing sensors" do
      Temperature.new.number_missing_sensors(4).should eq 0
    end

    it "should return 1 if there is one missing sensor" do
      Temperature.new.number_missing_sensors(3).should eq 1
    end

    it "should return 2 if there are two missing sensors" do
      Temperature.new.number_missing_sensors(2).should eq 2
    end

    it "should return 3 if there are three missing sensors" do
      Temperature.new.number_missing_sensors(1).should eq 3
    end

    it "should return 1 if there is 1 missing sensor when having a big number of sensors" do
      Temperature.new.number_missing_sensors(15).should eq 1
    end
  end
end
