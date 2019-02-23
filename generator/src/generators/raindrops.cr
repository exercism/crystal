require "../exercise_generator"
require "../exercise_test_case"

class RaindropsGenerator < ExerciseGenerator
  def exercise_name
    "raindrops"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      RaindropsTestCase.from_json(test_case.to_json)
    end
  end
end

class RaindropsTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "Raindrops.#{property}(#{input.number}).should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
