require "../exercise_generator"
require "../exercise_test_case"

class PerfectNumbersGenerator < ExerciseGenerator
  def exercise_name
    "perfect-numbers"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        PerfectNumbersTestCase.from_json(test_case.to_json)
      end
    end
  end
end

class PerfectNumbersTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
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
    expected: String | Error
  )

  def workload
    if expected.is_a?(Error)
      <<-WL
      expect_raises(ArgumentError) do
            PerfectNumbers.#{property}(#{input.number})
          end
      WL
    else
      "PerfectNumbers.#{property}(#{input.number}).should eq(\"#{expected}\")"
    end
  end

  def test_name
    description
  end
end
