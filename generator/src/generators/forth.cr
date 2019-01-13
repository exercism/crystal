require "../exercise_generator"
require "../exercise_test_case"

class ForthGenerator < ExerciseGenerator
  def exercise_name
    "forth"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |group|
      group["cases"].as_a.map do |test_case|
        ForthTestCase.new(test_case)
      end
    end
  end
end

class ForthTestCase < ExerciseTestCase
  private getter input : JSON::Any | String
  private getter description : JSON::Any
  private getter expected : Array(JSON::Any) | Nil

  def initialize(test_case)
    @input = test_case["input"]["instructions"][0].as_s
    @description = test_case["description"]
    @expected = test_case["expected"].as_a?
  end

  def workload
    if expected
      "Forth.evaluate(#{input.inspect}).should eq(#{fix_empty_array(expected)})"
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
