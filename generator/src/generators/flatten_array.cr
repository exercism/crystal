require "../generator"
require "../nested"

class FlattenArrayTestCase
  class Input
    Nested.array name: InputArray, element_type: Int32?, depth: 4

    JSON.mapping({
      array: InputArray,
    })
  end

  include TestDSL
  include Exercise::TestCase(Input, Array(Int32))

  def output
    expected.empty? ? "[] of Nil" : expected
  end

  _it description do
    "FlattenArray.flatten(#{input.array}).should eq(#{output})"
  end
end

Generator.register :FlattenArray
