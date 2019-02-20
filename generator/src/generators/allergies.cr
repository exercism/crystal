require "../exercise_generator"
require "../exercise_test_case"

class AllergiesGenerator < ExerciseGenerator
  def exercise_name
    "allergies"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        AllergiesTestCase.from_json(test_case.to_json)
      end
    end
  end
end

class AllergiesTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      item: String | Nil,
      score: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool | Array(String)
  )

  private def fix_empty_array(expected)
    if expected.is_a? Array(String) && expected.empty?
      "[] of String"
    else
      expected
    end
  end

  def workload
    if expected.is_a? Array(String)
      "Allergies.#{property.gsub(/([A-Z])/, "_\\1").downcase}(#{input.score}).should eq(#{fix_empty_array(expected)})"
    else
      "Allergies.#{property.gsub(/([A-Z])/, "_\\1").downcase}(\"#{input.item}\", #{input.score}).should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
