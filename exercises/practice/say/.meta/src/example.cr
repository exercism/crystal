module Say
  def self.number(n : Int64) : String
    raise ArgumentError.new unless n >= 0 && n < 1e12

    return zero if n.zero?

    groups = [] of String
    group_number = 0

    while n > 0
      unless (group = say_group(n % 1000)).empty?
        groups.unshift(group + " " + group_name[group_number])
      end
      n //= 1000
      group_number += 1
    end

    groups.join(" ").strip
  end

  private def self.say_group(n)
    said = ""

    if n // 100 > 0
      said += ones[n // 100] + " hundred"
      n -= (n // 100) * 100
      said += " " if n > 0
    end

    if tens[n // 10]?
      said += tens[n // 10]
      n -= (n // 10) * 10
      said += "-" if n > 0
    end

    if teens[n]?
      said += teens[n]
    elsif ones[n]?
      said += ones[n]
    end

    said
  end

  private def self.zero
    "zero"
  end

  private def self.ones
    {
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
    }
  end

  private def self.teens
    {
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
    }
  end

  private def self.tens
    {
      2 => "twenty",
      3 => "thirty",
      4 => "forty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety",
    }
  end

  private def self.group_name
    {
      0 => "",
      1 => "thousand",
      2 => "million",
      3 => "billion",
    }
  end
end
