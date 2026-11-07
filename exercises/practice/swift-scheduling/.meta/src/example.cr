module SwiftScheduling
  private def self.first_workday_of_month(year : Int32, month : Int32) : Time
    first = Time.utc(year, month, 1, 8, 0, 0)

    case first.day_of_week
    when Time::DayOfWeek::Saturday
      first + 2.days
    when Time::DayOfWeek::Sunday
      first + 1.day
    else
      first
    end
  end

  private def self.last_workday_of_month(year : Int32, month : Int32) : Time
    next_month = month == 12 ? 1 : month + 1
    next_year = month == 12 ? year + 1 : year

    last = Time.utc(next_year, next_month, 1, 8, 0, 0) - 1.day

    case last.day_of_week
    when Time::DayOfWeek::Saturday
      last - 1.day
    when Time::DayOfWeek::Sunday
      last - 2.days
    else
      last
    end
  end

  def self.delivery_date(meeting_start : Time, description : String) : Time
    result = meeting_start
    case description
    when "NOW"
      result = meeting_start + 2.hours
    when "ASAP"
      if meeting_start.hour < 13
        result = Time.utc(meeting_start.year, meeting_start.month, meeting_start.day, 17, 0, 0)
      else
        tomorrow = meeting_start + 1.day
        result = Time.utc(tomorrow.year, tomorrow.month, tomorrow.day, 13, 0, 0)
      end
    when "EOW"
      case meeting_start.day_of_week.to_i
      when 1..3 # Monday to Wednesday
        friday = meeting_start + (5 - meeting_start.day_of_week.to_i).days
        result = Time.utc(friday.year, friday.month, friday.day, 17, 0, 0)
      when 4, 5 # Thursday or Friday
        sunday = meeting_start + (7 - meeting_start.day_of_week.to_i).days
        result = Time.utc(sunday.year, sunday.month, sunday.day, 20, 0, 0)
      end
    else
      # | `"<N>M"`    | Before N-th month         | At 8:00 on the _first_ workday of this year's N-th month  |
      # | `"<N>M"`    | After or in N-th month    | At 8:00 on the _first_ workday of next year's N-th month  |
      # | `"Q<N>"`    | Before or in N-th quarter | At 8:00 on the _last_ workday of this year's N-th quarter |
      # | `"Q<N>"`    | After N-th quarter        | At 8:00 on the _last_ workday of next year's N-th quarter |
      if description.includes?("M")
        month = description[0..-2].to_i
        year = meeting_start.month < month ? meeting_start.year : meeting_start.year + 1
        result = first_workday_of_month(year, month)
      elsif description.includes?("Q")
        quarter = description[1..-1].to_i
        start_quarter = ((meeting_start.month - 1) // 3) + 1
        year = start_quarter <= quarter ? meeting_start.year : meeting_start.year + 1
        result = last_workday_of_month(year, quarter * 3)
      end
    end
    result
  end
end
