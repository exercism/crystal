require "spec"
require "../src/*"

describe "HelloWorld" do
  it "Say Hello, World!" do
    HelloWorld.new.hello.should eq("Hello, World!")
  end
end
