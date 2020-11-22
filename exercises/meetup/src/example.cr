module Meetup
  extend self

  START_DAYS = {
    "teenth" => 13,
    "first"  => 1,
    "second" => 8,
    "third"  => 15,
    "fourth" => 22,
    "last"   => 1,
  } of String => Int32

  DAYS_IN_WEEK = 7

  def meetup(year : Number, month : Number, week : String, day_of_week : String) : String
    time = Time.utc(year, month, START_DAYS[week])
    day = Time::DayOfWeek.parse(day_of_week).to_i

    if (week == "last")
      t = time.at_end_of_month
      result = (t - ((DAYS_IN_WEEK - (day - t.day_of_week.to_i)) % DAYS_IN_WEEK).day)
    else
      result = (time + ((day - time.day_of_week.to_i) % DAYS_IN_WEEK).day)
    end

    result.to_s("%Y-%m-%d")
  end
end
