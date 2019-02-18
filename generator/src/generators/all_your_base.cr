require "../exercise_generator"
require "../exercise_test_case"

class AllYourBaseGenerator < ExerciseGenerator
  def exercise_name
    "all-your-base"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      AllYourBaseTestCase.from_json(test_case.to_json)
    end
  end
end

class AllYourBaseTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      inputBase: Int32,
      digits: Array(Int32),
      outputBase: Int32
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
    expected: Array(Int32) | Error
  )

  def fix_empty_array(digits : Array(Int32)) : String
    digits.size == 0 ? "[] of Int32" : digits.to_s
  end

  def workload
    if expected.is_a?(Error)
      <<-WL
      expect_raises(ArgumentError) do
            AllYourBase.#{property}(#{input.inputBase}, #{fix_empty_array(input.digits)}, #{input.outputBase})
          end
      WL
    else
      "AllYourBase.#{property}(#{input.inputBase}, #{fix_empty_array(input.digits)}, #{input.outputBase}).should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
