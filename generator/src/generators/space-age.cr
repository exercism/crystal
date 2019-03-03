require "../exercise_generator"
require "../exercise_test_case"

class SpaceAgeGenerator < ExerciseGenerator
  def exercise_name
    "space-age"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      SpaceAgeTestCase.from_json(test_case.to_json)
    end
  end
end

class SpaceAgeTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      planet: String,
      seconds: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Float32
  )

  def workload
    "SpaceAge.#{property}(\"#{input.planet}\", #{input.seconds}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
