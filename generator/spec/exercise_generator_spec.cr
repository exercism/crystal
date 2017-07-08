require "spec"
require "../src/exercise_generator"
require "../src/exercise_test_case"

class DummyGenerator < ExerciseGenerator
  def exercise_name
    "dummy"
  end

  def test_cases
    [] of ExerciseTestCase
  end
end

describe "ExerciseGenerator" do
  describe "#describe_name" do
    it "will return the name of the exercise in camel case" do
      DummyGenerator.new.describe_name.should eq("Dummy")
    end
  end

  describe "#generate" do
    it "raises an error if no test cases exist" do
      expect_raises do
        DummyGenerator.generate
      end
    end
  end
end
