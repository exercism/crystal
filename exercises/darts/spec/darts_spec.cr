require "spec"
require "../src/*"

describe "Darts" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "Missed target" do
    Darts.score(-9.0, 9.0).should eq(0)
  end

  {{pending.id}} "On the outer circle" do
    Darts.score(0.0, 10.0).should eq(1)
  end

  {{pending.id}} "On the middle circle" do
    Darts.score(-5.0, 0.0).should eq(5)
  end

  {{pending.id}} "On the inner circle" do
    Darts.score(0.0, -1.0).should eq(10)
  end

  {{pending.id}} "Exactly on centre" do
    Darts.score(0.0, 0.0).should eq(10)
  end

  {{pending.id}} "Near the centre" do
    Darts.score(-0.1, -0.1).should eq(10)
  end

  {{pending.id}} "Just within the inner circle" do
    Darts.score(0.7, 0.7).should eq(10)
  end

  {{pending.id}} "Just outside the inner circle" do
    Darts.score(0.8, -0.8).should eq(5)
  end

  {{pending.id}} "Just within the middle circle" do
    Darts.score(-3.5, 3.5).should eq(5)
  end

  {{pending.id}} "Just outside the middle circle" do
    Darts.score(-3.6, -3.6).should eq(1)
  end

  {{pending.id}} "Just within the outer circle" do
    Darts.score(-7.0, 7.0).should eq(1)
  end

  {{pending.id}} "Just outside the outer circle" do
    Darts.score(7.1, -7.1).should eq(0)
  end

  {{pending.id}} "Asymmetric position between the inner and middle circles" do
    Darts.score(0.5, -4.0).should eq(5)
  end
  {% end %}
end
