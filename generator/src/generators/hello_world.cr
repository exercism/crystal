require "../generator"

class HelloWorldTestCase
  include TestDSL
  include Exercise::TestCase(Hash(String, Nil), String)

  _it description do
    "HelloWorld.hello.should eq(\"#{expected}\")"
  end
end

Generator.register :HelloWorld
