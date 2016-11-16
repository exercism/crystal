require "ecr"
require "json"
abstract class ExerciseGenerator
  METADATA_REPOSITORY = "x-common"

  def self.generate
    new.generate
  end

  def generate
    File.write(test_file, to_s)
  end

  def describe_name
    exercise_name.split('-').map(&.capitalize).join
  end

  abstract def exercise_name
  abstract def test_cases

  private def root
    File.expand_path(File.join("..", "..", "..", ".."), __FILE__)
  end

  private def test_file
    File.expand_path(File.join("exercises", exercise_name, "spec", "#{exercise_name.tr("-","_")}_spec.cr"), root)
  end

  private def metadata_dir
    File.expand_path(File.join("..", METADATA_REPOSITORY, "exercises", exercise_name), root)
  end

  private def data
    File.read(File.join(metadata_dir, "canonical-data.json"))
  end

  ECR.def_to_s "#{__DIR__}/templates/example.tt"
end
