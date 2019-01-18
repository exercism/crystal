require "../exercise_generator"
require "../exercise_test_case"

class HelloWorldGenerator < ExerciseGenerator
  def exercise_name
    "hello-world"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      HelloWorldTestCase.from_json(test_case.to_json)
    end
  end
end

class HelloWorldTestCase < ExerciseTestCase
  JSON.mapping(
    description: String,
    property: String,
    expected: String
  )

  def workload
    "HelloWorld.hello.should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
