require "spec"
require "../src/*"

describe "Navigation" do
  describe "Constants" do
    it "NEPTUNE_DISTANCE should be 4.4 billion km and be int64" do
      distance = Navigation::NEPTUNE_DISTANCE
      distance.should eq 4_400_000_000
      distance.should be_a(Int64)
    end

    it "MARS_DISTANCE should be 227_940_000 km and be int32" do
      distance = Navigation::MARS_DISTANCE
      distance.should eq 227_940_000
      distance.should be_a(Int32)
    end

    it "ATMOSPHERE_DISTANCE should be 10_000 km and be int16" do
      distance = Navigation::ATMOSPHERE_DISTANCE
      distance.should eq 10_000
      distance.should be_a(Int16)
    end
  end

  describe "correct_area_analysis" do
    it "Giving 9999 should return 9999 as Uint" do
      result = Navigation.new.correct_area_analysis(9_999)
      result.should eq 9_999
      result.should be_a(UInt32)
    end

    it "Giving 0 should return 0 as Uint" do
      result = Navigation.new.correct_area_analysis(0)
      result.should eq 0
      result.should be_a(UInt32)
    end
  end

  describe "calculate_velocity" do
    it "1000 m and 5 seconds should equal 200 meter per second" do
      calculation = Navigation.new.calculate_velocity(1000, 5)
      calculation.should eq 200
      calculation.should be_a(Float32)
    end

    it "502.5 m and 2.5 seconds should equal 201 meter per second" do
      calculation = Navigation.new.calculate_velocity(502.5, 2.5)
      calculation.should eq 201
      calculation.should be_a(Float32)
    end

    it "4531 m and 14.6 seconds should equal 310.34247 meter per second" do
      calculation = Navigation.new.calculate_velocity(4531, 14.6)
      calculation.should eq 310.34247_f32
      calculation.should be_a(Float32)
    end
  end
end
