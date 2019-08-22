require "spec"
require "../src/*"

describe "Proverb" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "zero pieces" do
    proverb = Proverb.recite([] of String)
    proverb.should eq([] of String)
  end

  {{pending.id}} "one piece" do
    proverb = Proverb.recite(["nail"])
    proverb.should eq(["And all for the want of a nail."])
  end

  {{pending.id}} "two pieces" do
    proverb = Proverb.recite(["nail",
"shoe"])
    proverb.should eq(["For want of a nail the shoe was lost.",
"And all for the want of a nail."])
  end

  {{pending.id}} "three pieces" do
    proverb = Proverb.recite(["nail",
"shoe",
"horse"])
    proverb.should eq(["For want of a nail the shoe was lost.",
"For want of a shoe the horse was lost.",
"And all for the want of a nail."])
  end

  {{pending.id}} "full proverb" do
    proverb = Proverb.recite(["nail",
"shoe",
"horse",
"rider",
"message",
"battle",
"kingdom"])
    proverb.should eq(["For want of a nail the shoe was lost.",
"For want of a shoe the horse was lost.",
"For want of a horse the rider was lost.",
"For want of a rider the message was lost.",
"For want of a message the battle was lost.",
"For want of a battle the kingdom was lost.",
"And all for the want of a nail."])
  end

  {{pending.id}} "four pieces modernized" do
    proverb = Proverb.recite(["pin",
"gun",
"soldier",
"battle"])
    proverb.should eq(["For want of a pin the gun was lost.",
"For want of a gun the soldier was lost.",
"For want of a soldier the battle was lost.",
"And all for the want of a pin."])
  end
  {% end %}
end
