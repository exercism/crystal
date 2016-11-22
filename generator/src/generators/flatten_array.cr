require "../exercise_generator"
require "../exercise_test_case"

class FlattenArrayGenerator < ExerciseGenerator
  def exercise_name
    "flatten-array"
  end

  def test_cases
    JSON.parse(data)["cases"].map do |test_case|
      FlattenArrayTestCase.new(test_case)
    end
  end
end

class FlattenArrayTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter input : JSON::Any
  private getter expected : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @input = test_case["input"]
    @expected = fix_empty_array(test_case["expected"])
  end

  def workload
    "FlattenArray.flatten(#{input}).should eq(#{expected})"
  end

  def test_name
    description
  end

  def fix_empty_array(input)
    if input.to_s.match(/\[\]/)
      json = "[] of Nil".to_json
      JSON.parse(json)
    else
      input
    end
  end
end
