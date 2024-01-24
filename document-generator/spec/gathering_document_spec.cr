require "spec"
require "../src/generator"

describe DocumentGenerator do
    it "should be able to parse a document" do
        document = DocumentGenerator.new.read_markdown(File.read("document-generator/spec/assets/about.md"))
        document.should eq({"chapter" => {"Cool Title" => "# Cool Title\n\nrandom text\n\n```crystal\ncool text\n# Here is a comment\n```\n\n", "subtitle" => "## subtitle\n\nmore text\n\n", "links" => "[link]: https://exercism.com\n"}})
    end
end
