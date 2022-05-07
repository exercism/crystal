require "./remote_data_file"

require "ecr"
require "json"
require "json_mapping"

abstract class ExerciseGenerator
  METADATA_REPOSITORY = "problem-specifications"

  def self.generate
    new.generate
  end

  def generate
    raise "There are no test cases for #{exercise_name}" if test_cases.empty?
    File.write(test_file, to_s)
  end

  def describe_name
    exercise_name.split('-').map(&.capitalize).join
  end

  abstract def exercise_name
  abstract def test_cases

  private def root
    File.expand_path(File.join("..", "..", ".."), __FILE__)
  end

  private def test_file
    File.expand_path(File.join("exercises", "practice", exercise_name, "spec", "#{exercise_name.tr("-", "_")}_spec.cr"), root)
  end

  private def metadata_dir
    File.expand_path(File.join("..", METADATA_REPOSITORY, "exercises", exercise_name), root)
  end

  private def data
    local_data_file = File.join(metadata_dir, "canonical-data.json")
    if File.exists?(local_data_file)
      File.read(local_data_file)
    else
      remote_data_file = RemoteDataFile.new(exercise_name)
      File.read(remote_data_file.path)
    end
  end

  ECR.def_to_s "#{__DIR__}/templates/example.ecr"
end
