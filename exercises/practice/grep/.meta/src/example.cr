module Grep
  def self.search(pattern : String, flags : Array(String), files : Array(String)) : String
    # - `-n` Prepend the line number and a colon (':') to each line in the output, placing the number after the filename (if present).
    # - `-l` Output only the names of the files that contain at least one matching line.
    # - `-i` Match using a case-insensitive comparison.
    # - `-v` Invert the program -- collect all lines that fail to match.
    # - `-x` Search only for lines where the search string matches the entire line.

    results = [] of String
    files.each do |file|
      File.open("assets/#{file}") do |f|
        f.each_line.with_index(1) do |line, line_number|
          line_to_check = line.chomp
          pattern_to_check = pattern.dup

          if flags.includes?("-i")
            line_to_check = line_to_check.downcase
            pattern_to_check = pattern_to_check.downcase
          end

          is_match = if flags.includes?("-x")
                       line_to_check == pattern_to_check
                     else
                       line_to_check.includes?(pattern_to_check)
                     end

          is_match = !is_match if flags.includes?("-v")

          if is_match
            if flags.includes?("-l")
              results << file unless results.includes?(file)
              break
            else
              result_line = ""
              result_line += "#{file}:" if files.size > 1 && !flags.includes?("-l")
              result_line += "#{line_number}:" if flags.includes?("-n")
              result_line += line.chomp
              results << result_line
            end
          end
        end
      end
    end
    results.join("\n")
  end
end
