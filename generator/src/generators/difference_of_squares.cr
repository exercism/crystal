require "../exercise_generator"
require "../exercise_test_case"

class DifferenceOfSquaresGenerator < ExerciseGenerator
  def exercise_name
    "difference-of-squares"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |case_group|
      case_group["cases"].as_a.map do |test_case|
        DifferenceOfSquaresTestCase.new(test_case)
      end
    end
  end
end

class DifferenceOfSquaresTestCase < ExerciseTestCase
  private getter number : JSON::Any
  private getter description : JSON::Any
  private getter expected : JSON::Any?
  private getter type : String

  def initialize(test_case)
    @type = test_case["property"].as_s.gsub(/([A-Z])/, "_\\1").downcase
    @number = test_case["input"]["number"]
    @description = test_case["description"]
    @expected = test_case["expected"]?
  end

  def workload
    "Squares.#{type}(#{number}).should eq(#{expected})"
  end

  def test_name
    "calculates #{description} is #{expected}"
  end
end
