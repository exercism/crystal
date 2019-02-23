require "../exercise_generator"
require "../exercise_test_case"

class ProverbGenerator < ExerciseGenerator
  def exercise_name
    "proverb"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      ProverbTestCase.from_json(test_case.to_json)
    end
  end
end

class ProverbTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      strings: Array(String)
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String)
  )

  def format_array(strings : Array(String)) : String
    if strings.empty?
      return "[] of String"
    else
      return "[#{strings.map { |h| "\"#{h}\"" }.join(",\n")}]"
    end
  end

  def workload
    <<-WL
    proverb = Proverb.#{property}(#{format_array(input.strings)})
        proverb.should eq(#{format_array(expected)})
    WL
  end

  def test_name
    description
  end
end
