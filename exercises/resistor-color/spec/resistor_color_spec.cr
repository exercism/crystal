require "spec"
require "../src/*"

describe "ResistorColor" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "Black" do
    ResistorColor.color_code("black").should eq(0)
  end

  {{pending.id}} "White" do
    ResistorColor.color_code("white").should eq(9)
  end

  {{pending.id}} "Orange" do
    ResistorColor.color_code("orange").should eq(3)
  end

  {{pending.id}} "Colors" do
    ResistorColor.colors.should eq(["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"])
  end
  {% end %}
end
