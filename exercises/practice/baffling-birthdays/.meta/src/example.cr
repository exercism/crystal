class BafflingBirthdays
  def self.shared_birthday(birthdates : Array(Time)) : Bool
    birthdates.each_with_index do |date, idx|
      birthdates.each_with_index do |date_2, idx_2|
        if idx == idx_2
          next
        end
        if date.month == date_2.month && date.day == date_2.day
          return true
        end
      end
    end
    return false
  end

  def self.random_birthdates(size : Int) : Array(Time)
    result = [] of Time
    size.times do |_|
      time = Time.utc(2025, 1, 1).shift days: Random.rand(365)
      result << time
    end

    return result
  end

  def self.estimated_probability_of_shared_birthday(size : Int) : Float
    return (1..10000).sum { |_| shared_birthday(random_birthdates(size)) ? 1 : 0 } / 100.0
  end
end
