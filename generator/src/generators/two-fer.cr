require "../exercise_generator"
require "../exercise_test_case"

class TwoFerGenerator < ExerciseGenerator
  def exercise_name
    "two-fer"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      TwoFerTestCase.new(test_case)
    end
  end
end

class TwoFerTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter name : JSON::Any
  private getter expected : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @name = test_case["input"]["name"]
    @expected = test_case["expected"]
  end

  def test_case_argument(input)
    "(\"#{input}\")" unless input == nil
  end

  def workload
    "TwoFer.two_fer#{test_case_argument(name)}.should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
