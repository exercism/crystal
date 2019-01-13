require "../exercise_generator"
require "../exercise_test_case"

class PascalsTriangleGenerator < ExerciseGenerator
  def exercise_name
    "pascals-triangle"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.select { |g| g.as_h.has_key?("cases") }.flat_map do |group|
      group.as_h["cases"].as_a.map do |test_case|
        PascalsTriangleTestCase.new(test_case)
      end
    end
  end
end

class PascalsTriangleTestCase < ExerciseTestCase
  private getter description : JSON::Any
  private getter count : JSON::Any
  private getter expected : JSON::Any

  def initialize(test_case)
    @description = test_case["description"]
    @count = test_case["input"]["count"]
    @expected = fix_empty_array(test_case["expected"])
  end

  def workload
    if !error?
      "PascalsTriangle.rows(#{count}).should eq(#{expected})"
    else
      <<-WL
      expect_raises(ArgumentError) do
            PascalsTriangle.rows(#{count})
          end
      WL
    end
  end

  def test_name
    if !error?
      "will return the first #{count} row(s)"
    else
      "will raise an Argument error for #{description}"
    end
  end

  private def error?
    expected == -1
  end

  private def fix_empty_array(json)
    if json.to_s.match(/\[\]/)
      JSON.parse("[] of Int32".to_json)
    else
      json
    end
  end
end
