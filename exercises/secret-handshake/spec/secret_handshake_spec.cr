require "spec"
require "../src/*"

describe "SecretHandshake" do
  it "wink for 1" do
    SecretHandshake.commands(1).should eq(["wink"])
  end

  pending "double blink for 10" do
    SecretHandshake.commands(2).should eq(["double blink"])
  end

  pending "close your eyes for 100" do
    SecretHandshake.commands(4).should eq(["close your eyes"])
  end

  pending "jump for 1000" do
    SecretHandshake.commands(8).should eq(["jump"])
  end

  pending "combine two actions" do
    SecretHandshake.commands(3).should eq(["wink", "double blink"])
  end

  pending "reverse two actions" do
    SecretHandshake.commands(19).should eq(["double blink", "wink"])
  end

  pending "reversing one action gives the same action" do
    SecretHandshake.commands(24).should eq(["jump"])
  end

  pending "reversing no actions still gives no actions" do
    SecretHandshake.commands(16).should eq([] of String)
  end

  pending "all possible actions" do
    SecretHandshake.commands(15).should eq(["wink", "double blink", "close your eyes", "jump"])
  end

  pending "reverse all possible actions" do
    SecretHandshake.commands(31).should eq(["jump", "close your eyes", "double blink", "wink"])
  end

  pending "do nothing for zero" do
    SecretHandshake.commands(0).should eq([] of String)
  end
end
