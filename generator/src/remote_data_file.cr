require "http/client"

class RemoteDataFile
  BASE_URL = "https://raw.githubusercontent.com/exercism/x-common/master/exercises"
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
    "#{cache_dir}/#{DATA_FILE}"
  end

  private def cache_dir
    dirpath = "cache/#{@test_name}"

    unless Dir.exists?(dirpath)
      Dir.mkdir_p(dirpath)
    end

    dirpath
  end

  private def body
    response = HTTP::Client.get(url)
    case response.status_code
    when 200
      response.body
    when 404
      message = "A canonical-data.json doesn't exist for #{@test_name} in x-common. " +
                "Go make one!"
      raise message
    else
      raise "Error while requesting the #{@test_name} data file from GitHub... " +
            "Status was #{response.status_code}"
    end
  end

  private def url
    "#{BASE_URL}/#{@test_name}/#{DATA_FILE}"
  end
end
