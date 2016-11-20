require "./exercise_generator"
require "./exercise_test_case"

class AcronymGenerator < ExerciseGenerator
  def exercise_name
    "acronym"
  end

  def test_cases
    JSON.parse(data)["abbreviate"]["cases"].map do |test_case|
      AcronymTestCase.new(test_case)
    end
  end
end

class AcronymTestCase < ExerciseTestCase
  private getter phrase : JSON::Any
  private getter description : JSON::Any
  private getter expected : JSON::Any

  def initialize(test_case)
    @phrase = test_case["phrase"]
    @description = test_case["description"]
    @expected = test_case["expected"]
  end

  def workload
    "Acronym.abbreviate(\"#{phrase}\").should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
