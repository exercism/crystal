require "../exercise_generator"
require "../exercise_test_case"

class ResistorColorDuoGenerator < ExerciseGenerator
  def exercise_name
    "resistor-color-duo"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      ResistorColorDuoTestCase.from_json(test_case.to_json)
    end
  end
end

class ResistorColorDuoTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      colors: Array(String)
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "ResistorColorDuo.#{property}(#{input.colors}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
