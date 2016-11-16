require "./exercise_generator"
require "./exercise_test_case"

class HelloWorldGenerator < ExerciseGenerator
  def exercise_name
    "hello-world"
  end

  def test_cases
    JSON.parse(data)["cases"].map do |test_case|
      HelloWorldTestCase.from_json(test_case.to_json)
    end
  end
end

class HelloWorldTestCase < ExerciseTestCase
  JSON.mapping(
    description: String,
    name: String | Nil,
    expected: String
  )

  def workload
    if !name
      "HelloWorld.hello.should eq(\"#{expected}\")"
    else
      "HelloWorld.hello(\"#{name}\").should eq(\"#{expected}\")"
    end
  end

  def test_name
    description
  end
end
