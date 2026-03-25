class SplitSecondStopwatch
  def initialize
    @time = 0
    @split_times = [] of Int32
    @state = "ready"
  end

  def start
    if @state == "running"
      raise ArgumentError.new("Stopwatch is already running")
    end

    @state = "running"
  end

  def stop
    if @state != "running"
      raise ArgumentError.new("Stopwatch is not running")
    end

    @state = "stopped"
  end

  def total : String
    convert_time(@time + @split_times.sum)
  end

  def current_lap : String
    convert_time(@time)
  end

  def previous_laps : Array(String)
    @split_times.map { |t| convert_time(t) }
  end

  def state : String
    @state
  end

  def advance_time(time : String)
    parts = time.split(":").map(&.to_i)
    total_seconds = parts[0] * 3600 + parts[1] * 60 + parts[2]
    if @state == "running"
      @time += total_seconds
    end
  end

  def lap
    if @state != "running"
      raise ArgumentError.new("Stopwatch is not running")
    end

    @split_times << @time
    @time = 0
  end

  def reset
    if @state != "stopped"
      raise ArgumentError.new("Stopwatch needs to be stopped before it can be reset")
    end
    @time = 0
    @split_times.clear
    @state = "ready"
  end

  private def convert_time(time : Int32) : String
    hours = time / 3600
    minutes = (time % 3600) / 60
    seconds = time % 60

    "%02d:%02d:%02d" % [hours, minutes, seconds]
  end
end
