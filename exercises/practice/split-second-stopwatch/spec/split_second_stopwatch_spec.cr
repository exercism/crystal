require "spec"
require "../src/*"

describe "SplitSecondStopwatch" do
  it "new stopwatch starts in ready state" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.state.should eq("ready")
  end

  pending "new stopwatch's current lap has no elapsed time" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.current_lap.should eq("00:00:00")
  end

  pending "new stopwatch's total has no elapsed time" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.total.should eq("00:00:00")
  end

  pending "new stopwatch does not have previous laps" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.previous_laps.should eq([] of String)
  end

  pending "start from ready state changes state to running" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.state.should eq("running")
  end

  pending "start does not change previous laps" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.previous_laps.should eq([] of String)
  end

  pending "start initiates time tracking for current lap" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:05")

    stopwatch.current_lap.should eq("00:00:05")
  end

  pending "start initiates time tracking for total" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:23")

    stopwatch.total.should eq("00:00:23")
  end

  pending "start cannot be called from running state" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    expect_raises(ArgumentError) do
      stopwatch.start
    end
  end

  pending "stop from running state changes state to stopped" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.stop

    stopwatch.state.should eq("stopped")
  end

  pending "stop pauses time tracking for current lap" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:05")

    stopwatch.stop

    stopwatch.advance_time("00:00:08")

    stopwatch.current_lap.should eq("00:00:05")
  end

  pending "stop pauses time tracking for total" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:13")

    stopwatch.stop

    stopwatch.advance_time("00:00:44")

    stopwatch.total.should eq("00:00:13")
  end

  pending "stop cannot be called from ready state" do
    stopwatch = SplitSecondStopwatch.new

    expect_raises(ArgumentError) do
      stopwatch.stop
    end
  end

  pending "stop cannot be called from stopped state" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.stop

    expect_raises(ArgumentError) do
      stopwatch.stop
    end
  end

  pending "start from stopped state changes state to running" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.stop

    stopwatch.start

    stopwatch.state.should eq("running")
  end

  pending "start from stopped state resumes time tracking for current lap" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:01:20")

    stopwatch.stop

    stopwatch.advance_time("00:00:20")

    stopwatch.start

    stopwatch.advance_time("00:00:08")

    stopwatch.current_lap.should eq("00:01:28")
  end

  pending "start from stopped state resumes time tracking for total" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:23")

    stopwatch.stop

    stopwatch.advance_time("00:00:44")

    stopwatch.start

    stopwatch.advance_time("00:00:09")

    stopwatch.total.should eq("00:00:32")
  end

  pending "lap adds current lap to previous laps" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:01:38")

    stopwatch.lap

    stopwatch.previous_laps.should eq(["00:01:38"])

    stopwatch.advance_time("00:00:44")

    stopwatch.lap

    stopwatch.previous_laps.should eq(["00:01:38", "00:00:44"])
  end

  pending "lap resets current lap and resumes time tracking" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:08:22")

    stopwatch.lap

    stopwatch.current_lap.should eq("00:00:00")

    stopwatch.advance_time("00:00:15")

    stopwatch.current_lap.should eq("00:00:15")
  end

  pending "lap continues time tracking for total" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:22")

    stopwatch.lap

    stopwatch.advance_time("00:00:33")

    stopwatch.total.should eq("00:00:55")
  end

  pending "lap cannot be called from ready state" do
    stopwatch = SplitSecondStopwatch.new

    expect_raises(ArgumentError) do
      stopwatch.lap
    end
  end

  pending "lap cannot be called from stopped state" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.stop

    expect_raises(ArgumentError) do
      stopwatch.lap
    end
  end

  pending "stop does not change previous laps" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:11:22")

    stopwatch.lap

    stopwatch.previous_laps.should eq(["00:11:22"])

    stopwatch.stop

    stopwatch.previous_laps.should eq(["00:11:22"])
  end

  pending "reset from stopped state changes state to ready" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.stop

    stopwatch.reset

    stopwatch.state.should eq("ready")
  end

  pending "reset resets current lap" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:10")

    stopwatch.stop

    stopwatch.reset

    stopwatch.current_lap.should eq("00:00:00")
  end

  pending "reset clears previous laps" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("00:00:10")

    stopwatch.lap

    stopwatch.advance_time("00:00:20")

    stopwatch.lap

    stopwatch.previous_laps.should eq(["00:00:10", "00:00:20"])

    stopwatch.stop

    stopwatch.reset

    stopwatch.previous_laps.should eq([] of String)
  end

  pending "reset cannot be called from ready state" do
    stopwatch = SplitSecondStopwatch.new

    expect_raises(ArgumentError) do
      stopwatch.reset
    end
  end

  pending "reset cannot be called from running state" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    expect_raises(ArgumentError) do
      stopwatch.reset
    end
  end

  pending "supports very long laps" do
    stopwatch = SplitSecondStopwatch.new

    stopwatch.start

    stopwatch.advance_time("01:23:45")

    stopwatch.current_lap.should eq("01:23:45")

    stopwatch.lap

    stopwatch.previous_laps.should eq(["01:23:45"])

    stopwatch.advance_time("04:01:40")

    stopwatch.current_lap.should eq("04:01:40")

    stopwatch.total.should eq("05:25:25")

    stopwatch.lap

    stopwatch.previous_laps.should eq(["01:23:45", "04:01:40"])

    stopwatch.advance_time("08:43:05")

    stopwatch.current_lap.should eq("08:43:05")

    stopwatch.total.should eq("14:08:30")

    stopwatch.lap

    stopwatch.previous_laps.should eq(["01:23:45", "04:01:40", "08:43:05"])
  end
end
