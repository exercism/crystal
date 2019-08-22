require "spec"
require "../src/*"

describe "SecretHandshake" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "wink for 1" do
    SecretHandshake.commands(1).should eq(["wink"])
  end

  {{pending.id}} "double blink for 10" do
    SecretHandshake.commands(2).should eq(["double blink"])
  end

  {{pending.id}} "close your eyes for 100" do
    SecretHandshake.commands(4).should eq(["close your eyes"])
  end

  {{pending.id}} "jump for 1000" do
    SecretHandshake.commands(8).should eq(["jump"])
  end

  {{pending.id}} "combine two actions" do
    SecretHandshake.commands(3).should eq(["wink", "double blink"])
  end

  {{pending.id}} "reverse two actions" do
    SecretHandshake.commands(19).should eq(["double blink", "wink"])
  end

  {{pending.id}} "reversing one action gives the same action" do
    SecretHandshake.commands(24).should eq(["jump"])
  end

  {{pending.id}} "reversing no actions still gives no actions" do
    SecretHandshake.commands(16).should eq([] of String)
  end

  {{pending.id}} "all possible actions" do
    SecretHandshake.commands(15).should eq(["wink", "double blink", "close your eyes", "jump"])
  end

  {{pending.id}} "reverse all possible actions" do
    SecretHandshake.commands(31).should eq(["jump", "close your eyes", "double blink", "wink"])
  end

  {{pending.id}} "do nothing for zero" do
    SecretHandshake.commands(0).should eq([] of String)
  end
  {% end %}
end
