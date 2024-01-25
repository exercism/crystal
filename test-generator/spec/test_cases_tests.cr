require "spec"
require "../src/generator_help"
require "compiler/crystal/formatter"

describe "Test case" do
  describe "Toml" do
    it "Can import toml where no test cases are removed" do
        generator_help = GeneratorHelp.new("two-fer")
        test_cases = generator_help.toml("./test-generator/spec/assets/toml-files/all-tests-included/.meta/tests.toml")
        test_cases.should eq ["1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce", "b4c6dbb8-b4fb-42c2-bafd-10785abe7709", "3549048d-1a6e-4653-9a79-b0bda163e8d5"]
    end

    it "Can import toml where one test case is removed" do
        generator_help = GeneratorHelp.new("two-fer")
        test_cases = generator_help.toml("test-generator/spec/assets/toml-files/one-tests-removed/.meta/tests.toml")
        test_cases.should eq ["1cf3e15a-a3d7-4a87-aeb3-ba1b43bc8dce", "3549048d-1a6e-4653-9a79-b0bda163e8d5"]
    end

    it "Can import toml where all test cases are removed" do
        generator_help = GeneratorHelp.new("two-fer")
        test_cases = generator_help.toml("test-generator/spec/assets/toml-files/all-tests-removed/.meta/tests.toml")
        test_cases.should eq Array(String).new
    end
  end

  describe "Test Cases" do
    it "Can import test case" do
        generator_help = GeneratorHelp.new("two-fer")
        toml = generator_help.toml("./test-generator/spec/assets/toml-files/all-tests-included/.meta/tests.toml")
        generator_help.remove_tests(toml)
        json = generator_help.@json

        json.should eq (JSON.parse(File.read("./test-generator/spec/assets/json-files/all-tests-included.json")))
    end

    it "Can import test case where one test case is removed" do
        generator_help = GeneratorHelp.new("two-fer")
        toml = generator_help.toml("./test-generator/spec/assets/toml-files/one-tests-removed/.meta/tests.toml")
        generator_help.remove_tests(toml)
        json = generator_help.@json

        json.should eq (JSON.parse(File.read("./test-generator/spec/assets/json-files/one-tests-removed.json")))
    end

    it "Can import test case where all test cases are removed" do
        generator_help = GeneratorHelp.new("two-fer")
        toml = generator_help.toml("./test-generator/spec/assets/toml-files/all-tests-removed/.meta/tests.toml")
        generator_help.remove_tests(toml)
        json = generator_help.@json

        json.should eq (JSON.parse(File.read("./test-generator/spec/assets/json-files/all-tests-removed.json")))
    end
  end
end
