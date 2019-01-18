require "../exercise_generator"
require "../exercise_test_case"

class PascalsTriangleGenerator < ExerciseGenerator
  def exercise_name
    "pascals-triangle"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.select { |g| g.as_h.has_key?("cases") }.flat_map do |group|
      group.as_h["cases"].as_a.map do |test_case|
        PascalsTriangleTestCase.from_json(test_case.to_json)
      end
    end
  end
end

class PascalsTriangleTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      count: Int32
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(Array(Int32))
  )

  def workload
    "PascalsTriangle.rows(#{input.count}).should eq(#{fix_empty_array(expected)})"
  end

  private def fix_empty_array(expected)
    if expected.empty?
      "[] of Int32"
    else
      expected
    end
  end

  def test_name
    "will return the first #{input.count} row(s)"
  end
end
