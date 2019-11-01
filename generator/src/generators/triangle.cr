require "../exercise_generator"
require "../test_case_group"

class TriangleGenerator < ExerciseGenerator
  def exercise_name
    "triangle"
  end

  def test_cases
    TestCaseGroup(TriangleTestCase).from_json(data).all_cases
  end
end

class TriangleTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      sides: Tuple(JSON::Any, JSON::Any, JSON::Any)
    )

    def to_s(io)
      io << "{#{sides.map { |s| s.as_i? || s.as_f }.join(", ")}}"
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
