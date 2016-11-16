require "spec"
require "../src/*"

describe "HelloWorld" do

  it "tests no name" do
    HelloWorld.hello.should eq("Hello, World")
  end

  pending "tests sample name" do
    HelloWorld.hello("Alice").should eq("Hello, Alice")
  end

  pending "tests other sample name" do
    HelloWorld.hello("Bob").should eq("Hello, Bob")
  end
end
