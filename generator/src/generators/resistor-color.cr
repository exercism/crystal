require "../exercise_generator"
require "../exercise_test_case"

class ResistorColorGenerator < ExerciseGenerator
  def exercise_name
    "resistor-color"
  end

  def test_cases
    canonical_data = JSON.parse(data)

    # colorCode test cases
    test_cases = canonical_data["cases"][0]["cases"].as_a.map do |test_case|
      ResistorColorTestCase.from_json(test_case.to_json)
    end

    # colors test case
    test_cases.push(ResistorColorTestCase.from_json(canonical_data["cases"][1].to_json))
  end
end

class ResistorColorTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      color: String | Nil
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32 | Array(String)
  )

  def workload
    if input.color
      "ResistorColor.#{property.gsub(/([A-Z])/, "_\\1").downcase}(\"#{input.color}\").should eq(#{expected})"
    else
      "ResistorColor.#{property.gsub(/([A-Z])/, "_\\1").downcase}.should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
