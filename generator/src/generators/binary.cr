require "../exercise_generator"
require "../test_cases"

class BinaryGenerator < ExerciseGenerator
  def exercise_name
    "binary"
  end

  def test_cases
    TestCases(BinaryTestCase).from_json(data).cases
  end
end

class BinaryTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      binary: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32 | Nil
  )

  def workload
    if expected
      "Binary.to_decimal(\"#{input.binary}\").should eq(#{expected})"
    else
      <<-WL
      expect_raises(ArgumentError) do
            Binary.to_decimal("#{input.binary}")
          end
      WL
    end
  end

  def test_name
    description
  end
end
