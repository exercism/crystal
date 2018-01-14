require "spec"
require "../src/*"

describe "HelloWorld" do
  it "Say Hi!" do
    HelloWorld.hello.should eq("Hello, World!")
  end
end
