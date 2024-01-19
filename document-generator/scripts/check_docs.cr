require "../src/interface.cr"

module CheckDocs
  def self.check_docs
    Dir.new("./concepts").each_child do |doc|
      if File.exists?("./concepts/#{doc}/.meta/template.md")
        tempfile = File.tempfile("introduction.md").path
        p "Generating #{doc}"
        generator = Generator.new()
        generator.generate_doc(doc, tempfile)
        unless File.same_content?(tempfile, "./concepts/#{doc}/introduction.md")
          raise "Concept docs for #{doc} are not up to date"
        end
      end
    end

    Dir.new("./exercises/concept").each_child do |exercise|
      if File.exists?("./exercises/concept/#{exercise}/.meta/template.md")
        tempfile = File.tempfile("introduction.md").path
        p "Generating #{exercise}"
        generator = Generator.new()
        generator.generate_exercise_doc(exercise, tempfile)
        unless File.same_content?(tempfile, "./exercises/concept/#{exercise}/.docs/introduction.md")
          raise "Eexericse docs for #{exercise} are not up to date"
        end
      end
    end
  end
end

CheckDocs.check_docs
