require "spec"
require "../src/generator"

class HelloWorldTestTestCase
  include Exercise::TestCase(Hash(String, Nil), String)

  def test_description
    description
  end

  def test_workload
    "HelloWorld.hello.should eq(\"#{expected}\")"
  end
end

class HelloWorldTestGenerator < Generator::Base(HelloWorldTestTestCase)
  def local_path
    "#{__DIR__}/fixtures/hello-world.json"
  end
end

describe Generator::Base do
  describe "#to_s" do
    HelloWorldTestGenerator.new.to_s.should match(/HelloWorld\.hello\.should eq\("Hello, World!"\)/)
  end
end
