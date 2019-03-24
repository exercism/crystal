require "../exercise_generator"
require "../exercise_test_case"

class PrimeFactorsGenerator < ExerciseGenerator
  def exercise_name
    "prime-factors"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        PrimeFactorsTestCase.from_json(test_case.to_json)
      end
    end
  end
end

class PrimeFactorsTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      value: Int64
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(Int32)
  )

  def workload
    "PrimeFactors.#{property}(#{input.value}).should eq(#{fix_empty_array(expected)})"
  end

  private def fix_empty_array(expected)
    if expected.empty?
      "[] of Int32"
    else
      expected
    end
  end

  def test_name
    description
  end
end
