require "../exercise_generator"
require "../exercise_test_case"

class CollatzConjectureGenerator < ExerciseGenerator
  def exercise_name
    "collatz-conjecture"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      CollatzConjectureTestCase.from_json(test_case.to_json)
    end
  end
end

class CollatzConjectureTestCase < ExerciseTestCase
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
    expected: Int32 | Error
  )

  def workload
    if expected.is_a?(Error)
        <<-WL
        expect_raises(ArgumentError) do
              CollatzConjecture.#{property}(#{input.number})
            end
        WL
    else
        "CollatzConjecture.#{property}(#{input.number}).should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
