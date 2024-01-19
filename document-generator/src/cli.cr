require "option_parser"
require "./interface.cr"

OptionParser.parse do |parser|
  parser.banner = "Welcome to The Crystal Doc Generator"

  parser.on "-v", "--version", "Show version" do
    puts "version 0.1.0"
    exit
  end
  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end

  parser.on "--all", "Generate all docs" do
    Generator.new.generate_all
    exit
  end

  parser.on "-d [DOC]", "--doc [DOC]", "Generate doc for a specific file" do |doc|
    Generator.new.generate_doc(doc)
    exit
  end

  parser.on "-e [EXERCISE]", "--exercise [EXERCISE]", "Generate doc for a specific exercise" do |exercise|
    Generator.new.generate_exercise_doc(exercise)
    exit
  end
end





