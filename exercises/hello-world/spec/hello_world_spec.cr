require "spec"
require "../src/*"

describe "HelloWorld" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "Say Hi!" do
    HelloWorld.hello.should eq("Hello, World!")
  end
  {% end %}
end
