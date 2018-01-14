require "../exercise_generator"
require "../exercise_test_case"

class ForthGenerator < ExerciseGenerator
  def exercise_name
    "forth"
  end

  def test_cases
    test_cases = [] of JSON::Any
    JSON.parse(data)["cases"].each do |group|
      group.each do |a, b|
        test_cases.concat(b) if a.as_s == "cases"
      end
    end
    test_cases.map do |test_case|
      ForthTestCase.new(test_case)
    end
  end
end

class ForthTestCase < ExerciseTestCase
  private getter input : JSON::Any | String
  private getter description : JSON::Any
  private getter expected : JSON::Any?

  def initialize(test_case)
    @input = test_case["input"].as_a.join
    @description = test_case["description"]
    @expected = fix_empty_array(test_case["expected"]?)
  end

  def workload
    if expected
      "Forth.evaluate(#{input.inspect}).should eq(#{expected})"
    else
      <<-WL
      expect_raises(Exception) do
            Forth.evaluate(#{input.inspect})
          end
      WL
    end
  end

  def test_name
    description
  end

  private def fix_empty_array(json)
    if json.to_s.match(/\[\]/)
      JSON.parse("[] of Int32".to_json)
    else
      json
    end
  end
end
