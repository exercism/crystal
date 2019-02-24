require "../exercise_generator"
require "../exercise_test_case"

class SeriesGenerator < ExerciseGenerator
  def exercise_name
    "series"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      SeriesTestCase.from_json(test_case.to_json)
    end
  end
end

class SeriesTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      series: String,
      sliceLength: Int32
    )
  end

  class Error
    JSON.mapping(
      error: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: Array(String) | Error
  )

  def workload
    if expected.is_a?(Error)
      <<-WL
      expect_raises(ArgumentError) do
            Series.#{property}(\"#{input.series}\", #{input.sliceLength})
          end
      WL
    else
      "Series.#{property}(\"#{input.series}\", #{input.sliceLength}).should eq(#{expected})"
    end
  end

  def test_name
    description
  end
end
