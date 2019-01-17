require "../exercise_generator"
require "../exercise_test_case"

class IsogramGenerator < ExerciseGenerator
  def exercise_name
    "isogram"
  end

  def test_cases
    JSON.parse(data)["cases"][0]["cases"].as_a.map do |test_case|
      IsogramTestCase.new(test_case)
    end
  end
end

class IsogramTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter phrase : JSON::Any
  private getter expected : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @phrase = test_case["input"]["phrase"]
    @expected = test_case["expected"]
  end

  def workload
    "Isogram.isogram?(\"#{phrase}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
