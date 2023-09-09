module Transpose
  def self.transpose(input)
    lines = input.split("\n")
    max_width = lines.map(&.size).max

    lines
      .map(&.ljust(max_width, '\0'))
      .map(&.chars)
      .transpose
      .map(&.join)
      .map(&.gsub(/\0+$/, ""))
      .map(&.gsub(/\0/, ' '))
      .join('\n')
  end
end
