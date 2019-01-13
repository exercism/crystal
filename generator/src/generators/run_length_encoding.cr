require "../exercise_generator"
require "../exercise_test_case"

class RunLengthEncodingGenerator < ExerciseGenerator
  def exercise_name
    "run-length-encoding"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        if test_case["property"] == "consistency"
          RunLengthEncodingConsistencyTestCase.new(test_case)
        else
          RunLengthEncodingTestCase.new(test_case)
        end
      end
    end
  end
end

class RunLengthEncodingTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter input : JSON::Any
  private getter expected : JSON::Any
  private getter method : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @input = test_case["input"]["string"]
    @expected = test_case["expected"]
    @method = test_case["property"]
  end

  def workload
    "RunLengthEncoding.#{method}(\"#{input}\").should eq(\"#{expected}\")"
  end

  def test_name
    method.as_s + " " + description.as_s
  end
end

class RunLengthEncodingConsistencyTestCase < RunLengthEncodingTestCase
  def workload
    "RunLengthEncoding.decode(RunLengthEncoding.encode(\"#{input}\")).should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
