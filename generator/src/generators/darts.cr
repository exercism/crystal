require "../exercise_generator"
require "../exercise_test_case"

class DartsGenerator < ExerciseGenerator
  def exercise_name
    "darts"
  end

  def test_cases
    JSON.parse(data)["cases"][0]["cases"].as_a.map do |test_case|
      DartsCase.from_json(test_case.to_json)
    end
  end
end

class DartsCase < ExerciseTestCase
  class Input
    JSON.mapping(
      x: Float32,
      y: Float32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "Darts.#{property}(#{input.x}, #{input.y}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
