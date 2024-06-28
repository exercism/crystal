class Markdown
  def initialize(@markdown : String); end

  def to_html
    result = ""
    lines = @markdown.split("\n")
    lines.each_with_index do |line, index|
      level = line.scan(/^#+/)
      # TODO: Use present? method when Crystal1.10 is dropped
      if !level.empty? && level[0][0].size <= 6
        level = level[0][0].size
        result += "<h#{level}>#{parse_line(line[(level + 1)..-1])}</h#{level}>"
      elsif line.starts_with?('*')
        result += "#{index == 0 || !lines[index - 1].starts_with?("*") ? "<ul>" : nil}<li>#{parse_line(line[2..-1])}</li>#{index == lines.size - 1 || !lines[index + 1].starts_with?("*") ? "</ul>" : nil}"
      else
        result += "<p>#{parse_line(line)}</p>"
      end
    end
    result
  end

  private def parse_line(line : String) : String
    line.gsub(/__(.*?)__/) do |match|
      "<strong>#{match[2..-3]}</strong>"
    end.gsub(/_(.*?)_/) do |match|
      "<em>#{match[1..-2]}</em>"
    end
  end
end
