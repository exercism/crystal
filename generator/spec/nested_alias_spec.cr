require "spec"
require "../src/nested"

require "json"

class TestInput
  Nested.array name: TestInputArray, element_type: Int32?, depth: 4

  JSON.mapping({
    array: TestInputArray,
  })
end

alias Expanded = Array(Array(Array(Array(Array(Int32 | Nil) | Int32 | Nil) | Int32 | Nil) | Int32 | Nil) | Int32 | Nil)

describe "Nested.alias_array" do
  it "should be the correct type" do
    a = TestInput.from_json(%q({"array": [1, [2, [[3]], [4, [[5]]], 6, 7], 8]}))
    typeof(a.array).should eq(Expanded)
  end
end
