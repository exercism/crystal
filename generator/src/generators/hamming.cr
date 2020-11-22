require "../exercise_generator"
require "../test_cases"

class HammingGenerator < ExerciseGenerator
  def exercise_name
    "hamming"
  end

  def test_cases
    TestCases(HammingTestCase).from_json(data).cases
  end
end

class HammingTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      strand1: String,
      strand2: String
    )
  end

  class Error
    JSON.mapping(
      error: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32 | Error
  )

  def workload
    if expected.is_a?(Error)
      <<-WL
      expect_raises(ArgumentError) do
            Hamming.#{property}("#{input.strand1}", "#{input.strand2}")
          end
      WL
    else
      "Hamming.#{property}(\"#{input.strand1}\", \"#{input.strand2}\").should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
