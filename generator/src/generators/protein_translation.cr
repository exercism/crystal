require "../exercise_generator"
require "../exercise_test_case"

class ProteinTranslationGenerator < ExerciseGenerator
  def exercise_name
    "protein-translation"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        ProteinTranslationTestCase.from_json(test_case.to_json)
      end
    end
  end
end

class ProteinTranslationTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      strand: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String)
  )

  def workload
    "ProteinTranslation.#{property}(\"#{input.strand}\").should eq(#{fix_empty_array(expected)})"
  end

  private def fix_empty_array(expected)
    if expected.empty?
      "[] of String"
    else
      expected
    end
  end

  def test_name
    description
  end
end
