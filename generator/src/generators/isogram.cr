require "../exercise_generator"
require "../exercise_test_case"

class IsogramGenerator < ExerciseGenerator
  def exercise_name
    "isogram"
  end

  def test_cases
    JSON.parse(data)["cases"][0]["cases"].as_a.map do |test_case|
      IsogramTestCase.from_json(test_case.to_json)
    end
  end
end

class IsogramTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      phrase: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Isogram.isogram?(\"#{input.phrase}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
