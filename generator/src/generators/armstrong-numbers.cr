require "../exercise_generator"
require "../exercise_test_case"

class ArmstrongNumbersGenerator < ExerciseGenerator
  def exercise_name
    "armstrong-numbers"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      ArmstrongNumbersTestCase.from_json(test_case.to_json)
    end
  end
end

class ArmstrongNumbersTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "ArmstrongNumbers.armstrong_number?(#{input.number}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
