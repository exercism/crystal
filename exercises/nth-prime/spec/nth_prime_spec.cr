require "spec"
require "../src/*"

describe "NthPrime" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "first prime" do
    NthPrime.prime(1).should eq(2)
  end

  {{pending.id}} "second prime" do
    NthPrime.prime(2).should eq(3)
  end

  {{pending.id}} "sixth prime" do
    NthPrime.prime(6).should eq(13)
  end

  {{pending.id}} "big prime" do
    NthPrime.prime(10001).should eq(104743)
  end

  {{pending.id}} "there is no zeroth prime" do
    expect_raises(ArgumentError) do
      NthPrime.prime(0)
    end
  end
  {% end %}
end
