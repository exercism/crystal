require "../exercise_generator"
require "../exercise_test_case"
require "json"

class TriangleGenerator < ExerciseGenerator
  def exercise_name
    "triangle"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |category|
      category["cases"].as_a.map do |test_case|
        TriangleTestCase.from_json(test_case.to_json)
      end
    end
  end
end

class TriangleTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      sides: Array(Int32 | Float32)
    )

    def to_s(io)
      io << "[#{sides.map { |s| s.to_s }.join(", ")}]"
    end
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "Triangle.new(#{input}).#{property}?.should eq(#{expected})"
  end

  def test_name
    description
  end
end
