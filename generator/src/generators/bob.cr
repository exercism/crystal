require "../generator"

class BobTestCase
  class Input
    JSON.mapping({ heyBob: String })
  end

  include TestDSL
  include Exercise::TestCase(Input, String)

  def escaped
    input.heyBob.inspect
  end

  _it "responds to #{description}" do
    "Bob.#{test_method}(#{escaped}).should eq(\"#{expected}\")"
  end
end

Generator.register :Bob
