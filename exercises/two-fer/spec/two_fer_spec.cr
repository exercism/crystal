require "spec"
require "../src/*"

describe "TwoFer" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "no name given" do
    TwoFer.two_fer.should eq("One for you, one for me.")
  end

  {{pending.id}} "a name given" do
    TwoFer.two_fer("Alice").should eq("One for Alice, one for me.")
  end

  {{pending.id}} "another name given" do
    TwoFer.two_fer("Bob").should eq("One for Bob, one for me.")
  end
  {% end %}
end
