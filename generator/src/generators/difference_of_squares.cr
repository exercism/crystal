require "../exercise_generator"
require "../exercise_test_case"

class DifferenceOfSquaresGenerator < ExerciseGenerator
  def exercise_name
    "difference-of-squares"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        DifferenceOfSquaresTestCase.from_json(test_case.to_json)
      end
    end
  end
end

class DifferenceOfSquaresTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "Squares.#{property.gsub(/([A-Z])/, "_\\1").downcase}(#{input.number}).should eq(#{expected})"
  end

  def test_name
    "calculates #{description} is #{expected}"
  end
end
