require "../generator"

class AcronymTestCase
  class Input
    JSON.mapping(phrase: String)
  end

  include TestDSL
  include Exercise::TestCase(Input, String)

  _it "does #{description}" do
    "Acronym.abbreviate(\"#{input.phrase}\").should eq(\"#{expected}\")"
  end
end

Generator.register :Acronym
