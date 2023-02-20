require "spec"
require "../formatter"

describe "Generator" do
  describe "format" do
    it "format files correctley" do
      temp_file = File.tempfile("temp")
      File.write(temp_file.path, Formatter.post_proccesing("./bin/test-templates/files-to-format/example.cr"))
      system("crystal tool format #{temp_file.path}")
      File.read(temp_file.path).should eq(File.read("./bin/test-templates/formatted-files/example.cr"))
      temp_file.delete
    end
  end
end
