require "./src/exercise_generator"
require "./src/generators/*"

if ARGV.empty?
  STDERR.puts "Exercise name required!\n"
  exit
end

exercise = ARGV[0]

klass = {{ExerciseGenerator.subclasses}}.find do |generator|
  generator.to_s == "#{exercise.split('-').map(&.capitalize).join}Generator"
end

raise "Undefined Generator" unless klass
klass.generate
