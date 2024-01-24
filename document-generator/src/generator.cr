class DocumentGenerator
  alias Docs = Hash(String, Hash(String, Hash(String, String)))
  getter documents = Docs.new
  property links = [] of String

  def read_documents(path)
    Dir.new(path).each_child do |folder|
      Dir.new(Path.new(path, folder)).each_child do |file|
        if file == "about.md"
          @documents[folder] = read_markdown(File.read(Path.new(path, folder, file)))
        end
      end
    end
  end
  
  def load_template(content : String)
    result = ""
    content.each_line do |line|
      match = line.match(/{%\s*([^%]+)\s*%}/)
      if match
        result += parse_expression(match[1])
      else
        result += "#{line}\n"
      end
    end
    result += @links.join
    result
  end

  def read_markdown(content : String)
    data = Hash(String, Hash(String, String)).new
    data["chapter"] = {} of String => String
    name = ""
    inside_code_block = false

    content.split("\n").each do |line|
      if line.starts_with?("```")
        inside_code_block = !inside_code_block
      end
      if line.starts_with?("#") && !inside_code_block
        name = line.lstrip("# ")
        data["chapter"][name] = line + "\n"
      elsif line =~ /^\s*\[[^\]]+\]\s*:\s*https?:\/\/[^\s]+\s*$/ && !inside_code_block
        if data["chapter"].has_key?("links")
          data["chapter"]["links"] += line + "\n"
        else
          data["chapter"]["links"] = line + "\n"
        end
      elsif data["chapter"][name]?
        data["chapter"][name] += line + "\n"
      else 
        raise "An Error occured while parsing, this is likely due to a missing header"
      end
    end
    return data
  end

  private def parse_expression(expression : String)
    chapters = Tuple(String, Array(String)).new("", [] of String)
    exclude = false
    expression.scan(/(?:[^\s"]|"[^"]*")+/).each do |part|
      part = part.to_a[0].not_nil!.gsub("\"", "")
      if part.starts_with?("$") && exclude
        exclude = false
        if part.includes?(".")
          concept, chapter = part.split(".")
          raise "Concept #{concept} or chapter #{chapter} not found" unless chapters[1].includes?(chapter)
          concepts = chapters[1]
          concepts.delete(chapter)
          chapters = {chapters[0], concepts}
        else
          raise "Concept #{part} not found"
        end
      elsif part.starts_with?("$")
        if part.includes?(".")
          concept, chapter = part.split(".")
          raise "Concept #{concept} or chapter #{chapter} not found" unless @documents[concept[1..]]["chapter"].has_key?(chapter)
          chapters = {concept[1..], [chapter]}
        else
          begin
            keys = @documents[part[1..]]["chapter"].keys
            keys.delete("links")
            chapters = {part[1..], (keys)}
          rescue
            raise "Concept #{part} not found"
          end
        end
      elsif part == "\\" || part == "exclude"
        exclude = true
      else
        raise "Unknown expression #{part}"
      end
    end
    text = generete_text(chapters)
    fetch_links(chapters[0], text)
    text
  end

  private def generete_text(chapters : Tuple(String, Array(String))) : String
    text = ""
    chapters[1].each do |concept|
      text += @documents[chapters[0]]["chapter"][concept]
    end
    if text[-3..] == "\n\n\n"
      text = text[...-1]
    end
    text
  end

  private def fetch_links(concept, text)
    new_links = [] of String
    if !@documents[concept]["chapter"].has_key?("links")
      return
    end

    @documents[concept]["chapter"]["links"].each_line do |line|
      match = line.match(/\[([^\]]*?)\]:/)
      if match
        result = match[1]
        if text.includes?(result) && !@links.includes?("#{line}\n")
          new_links << "#{line}\n"
        end
      else
        raise "An Error occured while parsing links"
      end
    end
    @links = [*@links, *new_links]
  end
end
