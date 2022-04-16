class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  getter minutes : Int32
  private setter minutes : Int32
  private getter original_minutes : Int32

  def initialize(hour = 0, minute = 0)
    @original_minutes = (minute + (hour * MINUTES_PER_HOUR))
    @minutes = original_minutes.modulo(MINUTES_PER_DAY)
  end

  def +(other)
    self.minutes += other.minutes
    self
  end

  def -(other)
    self.minutes -= other.minutes
    self
  end

  def ==(other)
    minutes == other.minutes
  end

  def to_s
    "%02i:%02i" % [hour, minute]
  end

  def hour
    (minutes / MINUTES_PER_HOUR).modulo(HOURS_PER_DAY)
  end

  def minute
    minutes.modulo(MINUTES_PER_HOUR)
  end
end
