require "../exercise_generator"
require "../exercise_test_case"
require "json"

class TriangleGenerator < ExerciseGenerator
  def exercise_name
    "triangle"
  end

  def test_cases
    cases = [] of TriangleTestCase
    JSON.parse(data)["cases"].each do |category|
      category["cases"].each do |test_case|
        next if test_case["comments"]? # skip float cases
        cases << TriangleTestCase.from_json(test_case.to_json)
      end
    end
    cases
  end
end

class TriangleTestCase < ExerciseTestCase

  JSON.mapping(
    description: String,
    property: String,
    sides: Array(Int32),
    expected: Bool
  )

  def workload
    "Triangle.new(#{sides}).#{property}?.should eq(#{expected})"
  end

  def test_name
    description
  end
end
