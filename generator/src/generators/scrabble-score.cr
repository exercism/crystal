require "../exercise_generator"
require "../exercise_test_case"

class ScrabbleScoreGenerator < ExerciseGenerator
  def exercise_name
    "scrabble-score"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      ScrabbleScoreCase.from_json(test_case.to_json)
    end
  end
end

class ScrabbleScoreCase < ExerciseTestCase
  class Input
    JSON.mapping(
      word: String,
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Int32
  )

  def workload
    "ScrabbleScore.score(\"#{input.word}\").should eq(#{expected})"
  end

  def test_name
    description
  end
end
