require "../exercise_generator"
require "../exercise_test_case"

class ReverseStringGenerator < ExerciseGenerator
  def exercise_name
    "reverse-string"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      ReverseStringTestCase.from_json(test_case.to_json)
    end
  end
end

class ReverseStringTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      value: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "ReverseString.reverse(\"#{input.value}\").should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
