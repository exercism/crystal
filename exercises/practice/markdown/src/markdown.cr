class Markdown
  def initialize(markdown : String)
    @markdown = markdown
  end

  def to_html
    result = ""
    lines = @markdown.split("\n")
    i = 0
    lines.each do |line|
      if line.starts_with?('#')
        parsed_heading = parse_heading(line)
        unless parsed_heading.nil?
          lines[i] = parsed_heading
        end
      elsif line.starts_with?('*')
        lines[i] = parse_list(line, i - 1 == -1 || lines[i - 1], lines[i + 1]?)
      else
        lines[i] = "<p>#{parse_line(line)}</p>"
      end
      i += 1
    end
    lines.join
  end

  private def parse_list(line : String, previous_line : Bool | String, next_line : Nil | String) : String
    result = ""
    if previous_line.is_a?(Bool)
      result += "<ul>"
    elsif !previous_line.starts_with?(/<(ul|li)>/)
      result += "<ul>"
    end

    result += "<li>#{parse_line(line[2..-1])}</li>"

    if next_line.nil?
      result += "</ul>"
    elsif !next_line.starts_with?('*')
      result += "</ul>"
    end

    result
  end

  private def parse_heading(line : String) : String | Nil
    if line.starts_with?("#######")
      return "<p>#{line}</p>"
    elsif line.starts_with?("######")
      return "<h6>#{line[7..-1]}</h6>"
    elsif line.starts_with?("#####")
      return "<h5>#{line[6..-1]}</h5>"
    elsif line.starts_with?("####")
      return "<h4>#{line[5..-1]}</h4>"
    elsif line.starts_with?("###")
      return "<h3>#{line[4..-1]}</h3>"
    elsif line.starts_with?("##")
      return "<h2>#{line[3..-1]}</h2>"
    elsif line.starts_with?('#')
      return "<h1>#{line[2..-1]}</h1>"
    end
  end

  private def parse_line(line : String) : String
    temp_line = line
    loop do
      temp_line = line
      line = line.sub("__", "<strong>")
      line = line.sub("__", "</strong>")
      if temp_line == line
        break
      end
    end

    temp_line = line
    loop do
      temp_line = line
      line = line.sub("_", "<em>")
      line = line.sub("_", "</em>")
      if temp_line == line
        break
      end
    end

    line
  end
end
