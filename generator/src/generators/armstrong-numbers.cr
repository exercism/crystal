require "../exercise_generator"
require "../exercise_test_case"

class ArmstrongNumbersGenerator < ExerciseGenerator
  def exercise_name
    "armstrong-numbers"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      ArmstrongNumbersTestCase.new(test_case)
    end
  end
end

class ArmstrongNumbersTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter number : JSON::Any?
  private getter expected : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @number = test_case["input"]["number"]?
    @expected = test_case["expected"]
  end

  def workload
    "ArmstrongNumbers.armstrong_number?(#{number}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
