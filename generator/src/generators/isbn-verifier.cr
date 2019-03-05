require "../exercise_generator"
require "../exercise_test_case"

class IsbnVerifierGenerator < ExerciseGenerator
  def exercise_name
    "isbn-verifier"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      IsbnVerifierTestCase.from_json(test_case.to_json)
    end
  end
end

class IsbnVerifierTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      isbn: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    "IsbnVerifier.valid?(\"#{input.isbn}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
