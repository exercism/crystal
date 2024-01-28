require "json"
require "http/client"
require "ecr"
require "./generator_plugins.cr"

class GeneratorHelp
  include GeneratorPlugins
  @json : JSON::Any

  def initialize(@exercise : String)
    @first = true
    @json = get_remote_files()
  end

  def exectute
    check_config()
    additional_json()
    remove_tests(toml())
  end

  def toml(path : String = "./exercises/practice/#{@exercise}/.meta/tests.toml")
    uuid = [] of String
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

  def function(input : JSON::Any, arg_types : Array(String))
    func_string = input.to_s

    # Add types to function
    args_match = func_string.match(/^\((.*)\)\s*->/)
    if args_match && !args_match.captures.empty?
      if args_match.captures[0]
        typed_args = args_match.captures[0].as(String).split(",").map_with_index{ | elem, i | "#{elem.strip} : #{arg_types[i]}" }.join(",")
      else
        typed_args = ""
      end
      func_string = func_string.gsub(args_match[0], "->(#{typed_args}) {") + " }"
    end
    func_string.gsub("modulo", "%")
  end

  def status
    if @first
      @first = false
      return "it"
    end
    "pending"
  end

  def flattened_cases(cases : JSON::Any)
    flattened_cases = [] of JSON::Any

    cases.as_a.each do |cases|
      if cases["cases"]?
        cases["cases"].as_a.each do |cases|
          if cases["cases"]?
            flattened_cases.concat(cases["cases"].as_a)
          else
            flattened_cases << cases
          end
        end
      else
        flattened_cases << cases
      end
    end

    flattened_cases
  end

  ECR.def_to_s "./bin/templates/template.ecr"
end
