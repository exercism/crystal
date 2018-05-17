require "logger"

class Logging < Logger
  def initialize(@io : IO?)
    super
    @level = Logger::DEBUG if ENV["DEBUG"]?
  end

  def self.instance
    @@logger ||= new(STDOUT)
  end
end

Log = Logging.instance
