require "../exercise_generator"
require "../exercise_test_case"

class LuhnGenerator < ExerciseGenerator
  def exercise_name
    "luhn"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      LuhnTestCase.from_json(test_case.to_json)
    end
  end
end

class LuhnTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      value: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Luhn.valid?(\"#{input.value}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
