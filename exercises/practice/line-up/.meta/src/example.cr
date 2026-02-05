module LineUp
  def self.format(name : String, number : Int32) : String
    number = case {number % 10, number % 100}
             when {_, 11..13}
               "#{number}th"
             when {1, _}
               "#{number}st"
             when {2, _}
               "#{number}nd"
             when {3, _}
               "#{number}rd"
             else
               "#{number}th"
             end
    "#{name}, you are the #{number} customer we serve today. Thank you!"
  end
end
