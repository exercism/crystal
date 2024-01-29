require "spec"
require "../src/generator_plugins"
require "json"

include GeneratorPlugins

describe GeneratorPlugins do
  describe "cammelcase" do
    it "should cammelcase a string" do
      to_cammel("hello-world").should eq "HelloWorld"
    end

    it "should be able to handle spaces" do
      to_cammel("hello-world 5").should eq "HelloWorld 5"
    end
  end

  describe "strain" do
    it "should modify contains function" do
      strain("fn(x) -> contains(x, 5)").should eq "x.includes?(5)"
    end

    it "should modify starts_with function" do
      strain("fn(x) -> starts_with(x, 'z')").should eq "x.starts_with?('z')"
    end

    it "should not modify other functions" do
      strain("fn(x) -> ends_with(x, 'z')").should eq "ends_with(x, 'z')"
    end
  end

  describe "binary_search_tree" do
    it "should be able to handle a tree" do
      tree = "{
        \"data\": \"4\",
        \"left\": {
          \"data\": \"2\",
          \"left\": {
            \"data\": \"1\",
            \"left\": null,
            \"right\": null
          },
          \"right\": {
            \"data\": \"3\",
            \"left\": null,
            \"right\": null
          }
        },
        \"right\": {
          \"data\": \"6\",
          \"left\": {
            \"data\": \"5\",
            \"left\": null,
            \"right\": null
          },
          \"right\": {
            \"data\": \"7\",
            \"left\": null,
            \"right\": null
          }
        }
      }
      "
      expected = "tree.value.should eq(4)\n" +
                 "left = tree.left.not_nil!\n" +
                 "          left.value.should eq(2)\n" +
                 "left_left = left.left.not_nil!\n" +
                 "          left_left.value.should eq(1)\n" +
                 "left_right = left.right.not_nil!\n" +
                 "          left_right.value.should eq(3)\n" +
                 "right = tree.right.not_nil!\n" +
                 "          right.value.should eq(6)\n" +
                 "right_left = right.left.not_nil!\n" +
                 "          right_left.value.should eq(5)\n" +
                 "right_right = right.right.not_nil!\n" +
                 "          right_right.value.should eq(7)\n"
      json = JSON.parse(tree)
      result = binary_search_tree(json)
      result.should eq expected
    end
  end

  describe "list_ops_array" do
    it "should not modify non-empty array" do
      json = JSON.parse("[1, 2, 3]")
      list_ops_array(json).should eq("[1, 2, 3]")
    end

    it "should append type for empty array" do
      json = JSON.parse("[]")
      list_ops_array(json).should eq("[] of Int32")
    end
  end

  describe "list_ops_nestable" do
    it "should not modify non-empty array with no empty elements" do
      json = JSON.parse("[[1], [2], [3], [4, 5, 6]]")
      list_ops_nestable(json).should eq("[[1], [2], [3], [4, 5, 6]]")
    end

    it "should append type for empty array" do
      json = JSON.parse("[]")
      list_ops_nestable(json).should eq("[] of Array(Int32)")
    end

    it "should append type for empty elements" do
      json = JSON.parse("[[1, 2], [3], [], [4, 5, 6]]")
      list_ops_nestable(json).should eq("[[1, 2], [3], [] of Int32, [4, 5, 6]]")
    end
  end

  describe "list_ops_function" do
    it "should convert function with modulo" do
      json = JSON.parse("\"(x) -> x modulo 2 == 1\"")
      list_ops_function(json, ["Int"]).should eq("->(x: Int) { x % 2 == 1 }")
    end

    it "should convert function with multiple args" do
      json = JSON.parse("\"(x, y) -> x + y\"")
      list_ops_function(json, ["Int", "Int"]).should eq("->(x: Int, y: Int) { x + y }")
    end
  end
end
