require "../exercise_generator"
require "../exercise_test_case"

class HelloWorldGenerator < ExerciseGenerator
  def exercise_name
    "hello-world"
  end

  def test_cases
    JSON.parse(data)["cases"].map do |test_case|
      HelloWorldTestCase.new(test_case)
    end
  end
end

class HelloWorldTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter name : JSON::Any?
  private getter expected : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @name = test_case["name"]?
    @expected = test_case["expected"]
  end

  def workload
    if name
      "HelloWorld.hello(\"#{name}\").should eq(\"#{expected}\")"
    else
      "HelloWorld.hello.should eq(\"#{expected}\")"
    end
  end

  def test_name
    description
  end
end
