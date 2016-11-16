require "spec"
require "../exercises/exercise_generator"
require "../exercises/exercise_test_case"

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

  describe "#to_s" do
    it "will output the generator test file using the example.tt" do
      DummyGenerator.new.to_s.should eq("require \"spec\"\nrequire \"../src/*\"\n\ndescribe \"Dummy\" do\nend\n")
    end
  end
end
