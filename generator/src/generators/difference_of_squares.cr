require "../exercise_generator"
require "../exercise_test_case"

class DifferenceOfSquaresGenerator < ExerciseGenerator
  def exercise_name
    "difference-of-squares"
  end

  def test_cases
    ["square_of_sum", "sum_of_squares", "difference_of_squares"]
      .reduce(Array(ExerciseTestCase).new) do |cases, type|
      cases + JSON.parse(data)[type]["cases"].map do |test_case|
        DifferenceOfSquaresTestCase.new(test_case, type)
      end
    end
  end
end

class DifferenceOfSquaresTestCase < ExerciseTestCase
  private getter number : JSON::Any
  private getter description : JSON::Any
  private getter expected : JSON::Any?
  private getter type : String

  def initialize(test_case, type)
    @type = type
    @number = test_case["number"]
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
