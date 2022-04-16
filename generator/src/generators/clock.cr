require "../exercise_generator"
require "../test_case_group"

class ClockGenerator < ExerciseGenerator
  def exercise_name
    "clock"
  end

  def test_cases
    JSON.parse(data)["cases"].as_a.flat_map do |group|
      group["cases"].as_a.map do |test_case|
        ClockTestCase.new(test_case)
      end
    end
  end
end

class ClockTestCase < ExerciseTestCase
  private getter input : JSON::Any
  private getter property : String
  private getter description : String
  private getter expected : JSON::Any | Nil

  def initialize(test_case)
    @input = test_case["input"]
    @property = test_case["property"].to_s
    @description = test_case["description"].to_s
    @expected = test_case["expected"]
  end

  def workload
    if input["clock1"]?
      multiclock_workload
    else
      single_clock_workload
    end
  end

  private def multiclock_workload
    <<-STRING
    clock1 = Clock.new(hour: #{input["clock1"]["hour"]}, minute: #{input["clock1"]["minute"]})
    clock2 = Clock.new(hour: #{input["clock2"]["hour"]}, minute: #{input["clock2"]["minute"]})
    clock1.#{equality_matcher}(clock2)
    STRING
  end

  private def equality_matcher
    if expected == false
      "should_not eq"
    else
      "should eq"
    end
  end

  private def single_clock_workload
    if property == "create"
      "Clock.new(hour: #{input["hour"]}, minute: #{input["minute"]}).to_s.should eq(\"#{expected}\")"
    elsif property == "add"
      <<-STRING
      clock = Clock.new(hour: #{input["hour"]}, minute: #{input["minute"]})
      (clock + Clock.new(minute: #{input["value"]})).to_s.should eq("#{expected}")
      STRING
    elsif property == "subtract"
      <<-STRING
      clock = Clock.new(hour: #{input["hour"]}, minute: #{input["minute"]})
      (clock - Clock.new(minute: #{input["value"]})).to_s.should eq("#{expected}")
      STRING
    else
      ""
    end
  end

  def test_name
    description
  end
end
