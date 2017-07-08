require "./exercise_generator"
require "./exercise_test_case"

class BinaryGenerator < ExerciseGenerator
  def exercise_name
    "binary"
  end

  def test_cases
    JSON.parse(data)["decimal"].map do |test_case|
      BinaryTestCase.new(test_case)
    end
  end
end

class BinaryTestCase < ExerciseTestCase
  private getter binary : JSON::Any
  private getter description : JSON::Any
  private getter expected : JSON::Any?

  def initialize(test_case)
    @binary = test_case["binary"]
    @description = test_case["description"]
    @expected = test_case["expected"]?
  end

  def workload
    if expected
      "Binary.to_decimal(\"#{binary}\").should eq(#{expected})"
    else
      <<-WL
      expect_raises do
            Binary.to_decimal(\"#{binary}\")
          end
      WL
    end
  end

  def test_name
    description
  end
end
