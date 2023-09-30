require "json"
require "http/client"
require "ecr"
require "./generator_plugins.cr"

class GeneratorHelp
  include GeneratorPlugins
  @tpl : String | Nil
  @json : JSON::Any

  def initialize(@exercise : String)
    @first = true
    check_config()
    @json = get_remote_files()
    additional_json()
    remove_tests(toml())
  end

  def toml
    uuid = [] of String
    path = "./exercises/practice/#{@exercise}/.meta/tests.toml"
    raise "Toml not found: #{path}" unless File.exists?(path)
    File.read(path).split("\n").each do |line|
      line = line.strip
      if line.starts_with? "#"
        next
      elsif line.starts_with? "["
        uuid << line[1...-1]
      elsif line.gsub(" ", "") == "include=false"
        uuid.pop
      end
    end
    uuid
  end

  def remove_tests(uuid : Array(String))
    @json["cases"].as_a.reverse.each do |test|
      if !uuid.includes?(test["uuid"]?) && !test["uuid"]?.nil?
        @json["cases"].as_a.delete(test)
      elsif !test["cases"]?.nil?
        test["cases"].as_a.reverse.each do |subtest|
          if !uuid.includes?(subtest["uuid"]?) && !subtest["uuid"]?.nil?
            test["cases"].as_a.delete(subtest)
          end
        end
      end
    end
  end

  def get_remote_files
    response = HTTP::Client.get("https://raw.githubusercontent.com/exercism/problem-specifications/main/exercises/#{@exercise}/canonical-data.json")
    case response.status_code
    when 200
      return JSON.parse(response.body)
    when 404
      return check_for_local_canonical_data()
    else
      raise "Error while requesting the #{@exercise} data file from GitHub... " +
            "Status was #{response.status_code}"
    end
  end

  def check_config
    config_file = File.read("./config.json")
    JSON.parse(config_file)["exercises"]["practice"].as_a.each do |x|
      return true if @exercise == x["slug"]
    end
    raise "Couldn't find the exercise in the config.json.\nMake sure you use the same slug name as in the config file."
  end

  def to_cammel(input : String)
    result = ""
    input = input.capitalize
    capitalized = false
    input.each_char do |character|
      if character == '-'
        capitalized = true
      else
        result += capitalized ? character.upcase : character
        capitalized = false
      end
    end
    result
  end

  def additional_json
    file_path = "./exercises/practice/#{@exercise}/.meta/additional_tests.json"
    if File.exists?(file_path)
      JSON.parse(File.read(file_path))["cases"].as_a.each do |test|
        @json["cases"].as_a << test
      end
    end
  end

  def check_for_local_canonical_data
    file_path = "./exercises/practice/#{@exercise}/.meta/canonical_data.json"
    if File.exists?(file_path)
      return JSON.parse(File.read(file_path))
    else
      raise "No canonical-data.json found"
    end
  end

  def to_capitalized(input)
    input.tr("-", "_").camelcase
  end

  def status
    if @first
      @first = false
      return "it"
    end
    "pending"
  end

  ECR.def_to_s "./bin/templates/template.ecr"
end
