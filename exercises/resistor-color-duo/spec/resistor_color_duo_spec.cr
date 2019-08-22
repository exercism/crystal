require "spec"
require "../src/*"

describe "ResistorColorDuo" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "Brown and black" do
    ResistorColorDuo.value(["brown", "black"]).should eq(10)
  end

  {{pending.id}} "Blue and grey" do
    ResistorColorDuo.value(["blue", "grey"]).should eq(68)
  end

  {{pending.id}} "Yellow and violet" do
    ResistorColorDuo.value(["yellow", "violet"]).should eq(47)
  end

  {{pending.id}} "Orange and orange" do
    ResistorColorDuo.value(["orange", "orange"]).should eq(33)
  end

  {{pending.id}} "Ignore additional colors" do
    ResistorColorDuo.value(["green", "brown", "orange"]).should eq(51)
  end
  {% end %}
end
