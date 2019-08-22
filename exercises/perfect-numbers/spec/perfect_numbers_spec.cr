require "spec"
require "../src/*"

describe "PerfectNumbers" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "Smallest perfect number is classified correctly" do
    PerfectNumbers.classify(6).should eq("perfect")
  end

  {{pending.id}} "Medium perfect number is classified correctly" do
    PerfectNumbers.classify(28).should eq("perfect")
  end

  {{pending.id}} "Large perfect number is classified correctly" do
    PerfectNumbers.classify(33550336).should eq("perfect")
  end

  {{pending.id}} "Smallest abundant number is classified correctly" do
    PerfectNumbers.classify(12).should eq("abundant")
  end

  {{pending.id}} "Medium abundant number is classified correctly" do
    PerfectNumbers.classify(30).should eq("abundant")
  end

  {{pending.id}} "Large abundant number is classified correctly" do
    PerfectNumbers.classify(33550335).should eq("abundant")
  end

  {{pending.id}} "Smallest prime deficient number is classified correctly" do
    PerfectNumbers.classify(2).should eq("deficient")
  end

  {{pending.id}} "Smallest non-prime deficient number is classified correctly" do
    PerfectNumbers.classify(4).should eq("deficient")
  end

  {{pending.id}} "Medium deficient number is classified correctly" do
    PerfectNumbers.classify(32).should eq("deficient")
  end

  {{pending.id}} "Large deficient number is classified correctly" do
    PerfectNumbers.classify(33550337).should eq("deficient")
  end

  {{pending.id}} "Edge case (no factors other than itself) is classified correctly" do
    PerfectNumbers.classify(1).should eq("deficient")
  end

  {{pending.id}} "Zero is rejected (not a natural number)" do
    expect_raises(ArgumentError) do
      PerfectNumbers.classify(0)
    end
  end

  {{pending.id}} "Negative integer is rejected (not a natural number)" do
    expect_raises(ArgumentError) do
      PerfectNumbers.classify(-1)
    end
  end
  {% end %}
end
