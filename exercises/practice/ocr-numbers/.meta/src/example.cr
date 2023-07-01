module OcrNumbers
  def self.convert(input : Array(String)) : String
    raise ArgumentError.new unless valid? input

    normalize(input).map { |row| convert_row(row) }.join(',')
  end

  private def self.valid?(input)
    input.size % 4 == 0 && input.all? { |row| row.size % 3 == 0 }
  end

  private def self.normalize(input)
    input.each_slice(4).map { |row| normalize_row(row) }
  end

  private def self.normalize_row(row)
    row.map { |s| partition(s) }.transpose
  end

  private def self.partition(s)
    s.scan(/.../).map(&.[0])
  end

  private def self.convert_row(row)
    row.map { |s| to_digit(s) }.join
  end

  private def self.to_digit(s)
    lookup.fetch(s, "?")
  end

  private def self.lookup
    {
      [
        " _ ",
        "| |",
        "|_|",
        "   ",
      ] => "0",

      [
        "   ",
        "  |",
        "  |",
        "   ",
      ] => "1",

      [
        " _ ",
        " _|",
        "|_ ",
        "   ",
      ] => "2",

      [
        " _ ",
        " _|",
        " _|",
        "   ",
      ] => "3",

      [
        "   ",
        "|_|",
        "  |",
        "   ",
      ] => "4",

      [
        " _ ",
        "|_ ",
        " _|",
        "   ",
      ] => "5",

      [
        " _ ",
        "|_ ",
        "|_|",
        "   ",
      ] => "6",

      [
        " _ ",
        "  |",
        "  |",
        "   ",
      ] => "7",

      [
        " _ ",
        "|_|",
        "|_|",
        "   ",
      ] => "8",

      [
        " _ ",
        "|_|",
        " _|",
        "   ",
      ] => "9",
    }
  end
end
