require "./generator.cr"

class Generator
  def initialize
    @document_generator = DocumentGenerator.new
    @document_generator.read_documents("./concepts")
  end

  def generate_all
    Dir.new("./concepts").each_child do |doc|
      @document_generator.links = [] of String
      if File.exists?("./concepts/#{doc}/.meta/template.md")
        p "Generating #{doc}"
        generate_doc(doc)
      end
    end

    Dir.new("./exercises/concept").each_child do |exercise|
      @document_generator.links = [] of String
      if File.exists?("./exercises/concept/#{exercise}/.meta/template.md")
        p "Generating #{exercise}"
        generate_exercise_doc(exercise)
      end
    end
  end

  def generate_doc(doc, output = "./concepts/#{doc}/introduction.md")
    path_template = Path.new("concepts", doc, ".meta", "template.md")

    template = File.read(path_template)
    content = @document_generator.load_template(template)

    File.write(output, content)
  end

  def generate_exercise_doc(exercise, output = "./exercises/concept/#{exercise}/.docs/introduction.md")
    path_template = Path.new("exercises", "concept", exercise, ".meta", "template.md")

    template = File.read(path_template)
    content = @document_generator.load_template(template)

    File.write(output, content)
  end
end
