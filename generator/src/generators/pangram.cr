require "../exercise_generator"
require "../exercise_test_case"

class PangramGenerator < ExerciseGenerator
  def exercise_name
    "pangram"
  end

  def test_cases
    JSON.parse(data)["cases"][0]["cases"].as_a.map do |test_case|
      PangramTestCase.from_json(test_case.to_json)
    end
  end
end

class PangramTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      sentence: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Pangram.pangram?(\"#{input.sentence.gsub("\"", "\\\"")}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
