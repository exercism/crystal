require "spec"
require "json"
require "../src/exercise_test_case"

class DummyTestCase < ExerciseTestCase
  def workload; end

  def test_name; end
end

describe "DummyTestCase" do
  describe "#pending" do
    it "outputs 'it' if the given integer is 0" do
      dummy_test_case = DummyTestCase.new
      dummy_test_case.pending?(0).should eq("it")
    end

    it "outputs 'pending' if the given integer is greater than 0" do
      dummy_test_case = DummyTestCase.new
      dummy_test_case.pending?(1).should eq("pending")
    end
  end
end
