require "spec"
require "../src/*"

describe "Acronym" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "does basic" do
    Acronym.abbreviate("Portable Network Graphics").should eq("PNG")
  end

  {{pending.id}} "does lowercase words" do
    Acronym.abbreviate("Ruby on Rails").should eq("ROR")
  end

  {{pending.id}} "does punctuation" do
    Acronym.abbreviate("First In, First Out").should eq("FIFO")
  end

  {{pending.id}} "does all caps word" do
    Acronym.abbreviate("GNU Image Manipulation Program").should eq("GIMP")
  end

  {{pending.id}} "does punctuation without whitespace" do
    Acronym.abbreviate("Complementary metal-oxide semiconductor").should eq("CMOS")
  end

  {{pending.id}} "does very long abbreviation" do
    Acronym.abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me").should eq("ROTFLSHTMDCOALM")
  end

  {{pending.id}} "does consecutive delimiters" do
    Acronym.abbreviate("Something - I made up from thin air").should eq("SIMUFTA")
  end

  {{pending.id}} "does apostrophes" do
    Acronym.abbreviate("Halley's Comet").should eq("HC")
  end

  {{pending.id}} "does underscore emphasis" do
    Acronym.abbreviate("The Road _Not_ Taken").should eq("TRNT")
  end
  {% end %}
end
