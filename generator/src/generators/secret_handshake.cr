require "../exercise_generator"
require "../exercise_test_case"

class SecretHandshakeGenerator < ExerciseGenerator
  def exercise_name
    "secret-handshake"
  end

  def test_cases
    JSON.parse(data)["cases"][0]["cases"].as_a.map do |test_case|
      SecretHandshakeTestCase.from_json(test_case.to_json)
    end
  end
end

class SecretHandshakeTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      number: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String)
  )

  def fix_empty_array(handshake : Array(String)) : String
    handshake.size == 0 ? "[] of String" : handshake.to_s
  end

  def workload
    "SecretHandshake.#{property}(#{input.number}).should eq(#{fix_empty_array(expected)})"
  end

  def test_name
    description
  end
end
