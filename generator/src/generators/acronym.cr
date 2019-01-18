require "../exercise_generator"
require "../exercise_test_case"

class AcronymGenerator < ExerciseGenerator
  def exercise_name
    "acronym"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.first["cases"].as_a.map do |test_case|
      AcronymTestCase.from_json(test_case.to_json)
    end
  end
end

class AcronymTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      phrase: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "Acronym.abbreviate(\"#{input.phrase}\").should eq(\"#{expected}\")"
  end

  def test_name
    "does #{description}"
  end
end
