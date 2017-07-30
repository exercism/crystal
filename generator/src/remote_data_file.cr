require "http/client"

class RemoteDataFile
  BASE_URL = "https://raw.githubusercontent.com/exercism/problem-specifications/master/exercises"
  DATA_FILE = "canonical-data.json"

  def initialize(@test_name : String); end

  def path
    if File.exists?(cache_file)
      cache_file
    else
      remote_file
    end
  end

  private def remote_file
    File.write(cache_file, body)
    cache_file
  end

  private def cache_file
    File.join(cache_dir, DATA_FILE)
  end

  private def cache_dir
    dirpath = File.expand_path(File.join("cache", @test_name), generator_root)

    unless Dir.exists?(dirpath)
      Dir.mkdir_p(dirpath)
    end

    dirpath
  end

  private def generator_root
    File.expand_path(File.join("..", ".."), __FILE__)
  end

  private def body
    response = HTTP::Client.get(url)
    case response.status_code
    when 200
      response.body
    when 404
      raise "A #{DATA_FILE} doesn't exist for #{@test_name} in problem-specifications. " +
            "Go make one!"
    else
      raise "Error while requesting the #{@test_name} data file from GitHub... " +
            "Status was #{response.status_code}"
    end
  end

  private def url
    [BASE_URL, @test_name, DATA_FILE].join("/")
  end
end
