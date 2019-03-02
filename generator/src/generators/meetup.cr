require "../exercise_generator"
require "../exercise_test_case"

class MeetupGenerator < ExerciseGenerator
  def exercise_name
    "meetup"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.map do |test_case|
      MeetupTestCase.from_json(test_case.to_json)
    end
  end
end

class MeetupTestCase < ExerciseTestCase
  class Input
    JSON.mapping(
      year: Int32,
      month: Int32,
      week: String,
      dayofweek: String
    )
  end

  JSON.mapping(
    description: String,
    property: String,
    input: Input,
    expected: String
  )

  def workload
    "Meetup.#{property}(#{input.year}, #{input.month}, \"#{input.week}\", \"#{input.dayofweek}\").should eq(\"#{expected}\")"
  end

  def test_name
    description
  end
end
