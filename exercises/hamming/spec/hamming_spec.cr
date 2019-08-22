require "spec"
require "../src/*"

describe "Hamming" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "empty strands" do
    Hamming.distance("", "").should eq(0)
  end

  {{pending.id}} "single letter identical strands" do
    Hamming.distance("A", "A").should eq(0)
  end

  {{pending.id}} "single letter different strands" do
    Hamming.distance("G", "T").should eq(1)
  end

  {{pending.id}} "long identical strands" do
    Hamming.distance("GGACTGAAATCTG", "GGACTGAAATCTG").should eq(0)
  end

  {{pending.id}} "long different strands" do
    Hamming.distance("GGACGGATTCTG", "AGGACGGATTCT").should eq(9)
  end

  {{pending.id}} "disallow first strand longer" do
    expect_raises(ArgumentError) do
      Hamming.distance("AATG", "AAA")
    end
  end

  {{pending.id}} "disallow second strand longer" do
    expect_raises(ArgumentError) do
      Hamming.distance("ATA", "AGTG")
    end
  end

  {{pending.id}} "disallow left empty strand" do
    expect_raises(ArgumentError) do
      Hamming.distance("", "G")
    end
  end

  {{pending.id}} "disallow right empty strand" do
    expect_raises(ArgumentError) do
      Hamming.distance("G", "")
    end
  end
  {% end %}
end
