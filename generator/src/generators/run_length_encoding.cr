require "./exercise_generator"
require "./exercise_test_case"

class RunLengthEncodingGenerator < ExerciseGenerator
  def exercise_name
    "run-length-encoding"
  end

  def test_cases
    JSON.parse(data)["cases"].map do |test_case|
      RunLengthEncodingTestCase.new(test_case)
    end
  end
end

class RunLengthEncodingTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter input : JSON::Any
  private getter expected : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @input = test_case["input"]
    @expected = test_case["expected"]
  end

  def workload
    "RunLengthEncoding.#{method}(\"#{input}\").should eq(\"#{expected}\")"
  end

  def test_name
    description
  end

  private def method
    if description.as_s.match(/encode/)
      "encode"
    else
      "decode"
    end
  end
end
