require "../exercise_generator"
require "../test_cases"

class MatchingBracketsGenerator < ExerciseGenerator
  def exercise_name
    "matching-brackets"
  end

  def test_cases
    TestCases(MatchingBracketsTestCase).from_json(data).cases
  end
end

class MatchingBracketsTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      value: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Bool
  )

  def workload
    # Must inspect - some inputs have backslashes that need to be escaped
    "MatchingBrackets.valid?(#{input.value.inspect}).should eq(#{expected})"
  end

  def test_name
    description
  end
end
