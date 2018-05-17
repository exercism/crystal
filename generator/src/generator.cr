require "./logging"
require "./exercise"
require "./remote_data_file"

# A `Generator` manages reading canonical-data and writing the corresponding spec file.
module Generator
  # `Generator::Base` should be subclassed to provide exercise specific handling of
  # canonical-data and the resulting spec file.
  #
  # Usage:
  #
  # ```
  # class HelloWorldTestCase
  # ...
  # end
  #
  # HelloWorldGenerator < Generator::Base(HelloWorldTestCase)
  # end
  # ```
  abstract class Base(T)
    ROOTDIR = "#{__DIR__}/../../"
    METADATA_REPO = "problem-specifications"

    def self.generate
      new.generate
    end

    def generate
      File.write(test_file, to_s)
    end

    def to_s
      Exercise::Spec(T).from_canonical(data).to_s
    end

    private def exercise
      {{ @type.stringify.gsub(/Generator/, "").gsub(/([a-z])([A-Z])/, "\\1-\\2").downcase }}
    end

    private def test_file
      File.expand_path("exercises/#{exercise}/spec/#{exercise.tr("-", "_")}_spec.cr", ROOTDIR)
    end

    private def local_path
      File.expand_path("../#{METADATA_REPO}/exercises/#{exercise}/canonical-data.json", ROOTDIR)
    end

    private def data
      begin
        File.read(local_path)
      rescue
        Log.debug("Failed to open #{local_path}. Attempting download ...")
        File.read(RemoteDataFile.new(exercise).path)
      end
    end
  end

  # Macro to automate the creation of a Generator::Base subclass,
  # provided the `Exercise::TestCase` subclass complies with naming
  # convention. The macro takes a string or symbol as its only argument,
  # which is the exercise-name in CamelCase.
  #
  # For example:
  #
  # ```
  # Generator.register :HelloWorld
  # ```
  #
  # Results in:
  #
  # ```
  # class HelloWorldGenerator < Generator::Base(HelloWorldTestCase)
  # end
  # ```
  macro register(t)
    class {{ t.id }}Generator < Generator::Base({{ t.id }}TestCase)
    end
  end
end

