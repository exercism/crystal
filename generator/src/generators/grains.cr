require "../exercise_generator"
require "../exercise_test_case"

class GrainsGenerator < ExerciseGenerator
  def exercise_name
    "grains"
  end

  def test_cases
    canonical_data = JSON.parse(data)
    # square test cases
    test_cases = canonical_data["cases"][0]["cases"].as_a.map do |test_case|
      GrainsTestCase.from_json(test_case.to_json)
    end

    # total test cases
    test_cases.push(GrainsTestCase.from_json(canonical_data["cases"][1].to_json))

    return test_cases
  end
end

class GrainsTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      square: Int32 | Nil
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
    expected: UInt64 | Error
  )

  def workload
    if expected.is_a?(Error)
      <<-WL
      expect_raises(ArgumentError) do
            Grains.#{property}(#{input.square})
          end
      WL
    elsif input.square
      "Grains.#{property}(#{input.square}).should eq(#{expected})"
    else
      "Grains.#{property}.should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
