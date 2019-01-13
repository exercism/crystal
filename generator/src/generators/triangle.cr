require "../exercise_generator"
require "../exercise_test_case"
require "json"

class TriangleGenerator < ExerciseGenerator
  def exercise_name
    "triangle"
  end

  def test_cases
    cases = [] of TriangleTestCase
    JSON.parse(data)["cases"].as_a.each do |category|
      category["cases"].as_a.each do |test_case|
        cases << TriangleTestCase.from_json(test_case.to_json)
      end
    end
    cases
  end
end

class Input
  JSON.mapping(
    sides: Array(Int32 | Float32)
  )
end

class TriangleTestCase < ExerciseTestCase
  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Triangle.new(#{input.sides}).#{property}?.should eq(#{expected})"
  end

  def test_name
    description
  end
end
