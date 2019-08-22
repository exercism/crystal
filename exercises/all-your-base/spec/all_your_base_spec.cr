require "spec"
require "../src/*"

describe "AllYourBase" do
  {% begin %}
  {% pending = if flag? :RUN_ALL_TESTS
                 :it
               else
                 :pending
               end
  %}

  it "single bit one to decimal" do
    AllYourBase.rebase(2, [1], 10).should eq([1])
  end

  {{pending.id}} "binary to single decimal" do
    AllYourBase.rebase(2, [1, 0, 1], 10).should eq([5])
  end

  {{pending.id}} "single decimal to binary" do
    AllYourBase.rebase(10, [5], 2).should eq([1, 0, 1])
  end

  {{pending.id}} "binary to multiple decimal" do
    AllYourBase.rebase(2, [1, 0, 1, 0, 1, 0], 10).should eq([4, 2])
  end

  {{pending.id}} "decimal to binary" do
    AllYourBase.rebase(10, [4, 2], 2).should eq([1, 0, 1, 0, 1, 0])
  end

  {{pending.id}} "trinary to hexadecimal" do
    AllYourBase.rebase(3, [1, 1, 2, 0], 16).should eq([2, 10])
  end

  {{pending.id}} "hexadecimal to trinary" do
    AllYourBase.rebase(16, [2, 10], 3).should eq([1, 1, 2, 0])
  end

  {{pending.id}} "15-bit integer" do
    AllYourBase.rebase(97, [3, 46, 60], 73).should eq([6, 10, 45])
  end

  {{pending.id}} "empty list" do
    AllYourBase.rebase(2, [] of Int32, 10).should eq([0])
  end

  {{pending.id}} "single zero" do
    AllYourBase.rebase(10, [0], 2).should eq([0])
  end

  {{pending.id}} "multiple zeros" do
    AllYourBase.rebase(10, [0, 0, 0], 2).should eq([0])
  end

  {{pending.id}} "leading zeros" do
    AllYourBase.rebase(7, [0, 6, 0], 10).should eq([4, 2])
  end

  {{pending.id}} "input base is one" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(1, [0], 10)
    end
  end

  {{pending.id}} "input base is zero" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(0, [] of Int32, 10)
    end
  end

  {{pending.id}} "input base is negative" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(-2, [1], 10)
    end
  end

  {{pending.id}} "negative digit" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1, -1, 1, 0, 1, 0], 10)
    end
  end

  {{pending.id}} "invalid positive digit" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1, 2, 1, 0, 1, 0], 10)
    end
  end

  {{pending.id}} "output base is one" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1, 0, 1, 0, 1, 0], 1)
    end
  end

  {{pending.id}} "output base is zero" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(10, [7], 0)
    end
  end

  {{pending.id}} "output base is negative" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1], -7)
    end
  end

  {{pending.id}} "both bases are negative" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(-2, [1], -7)
    end
  end
  {% end %}
end
