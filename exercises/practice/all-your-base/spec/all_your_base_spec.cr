require "spec"
require "../src/*"

describe "AllYourBase" do
  it "single bit one to decimal" do
    AllYourBase.rebase(2, [1], 10).should eq([1])
  end

  pending "binary to single decimal" do
    AllYourBase.rebase(2, [1, 0, 1], 10).should eq([5])
  end

  pending "single decimal to binary" do
    AllYourBase.rebase(10, [5], 2).should eq([1, 0, 1])
  end

  pending "binary to multiple decimal" do
    AllYourBase.rebase(2, [1, 0, 1, 0, 1, 0], 10).should eq([4, 2])
  end

  pending "decimal to binary" do
    AllYourBase.rebase(10, [4, 2], 2).should eq([1, 0, 1, 0, 1, 0])
  end

  pending "trinary to hexadecimal" do
    AllYourBase.rebase(3, [1, 1, 2, 0], 16).should eq([2, 10])
  end

  pending "hexadecimal to trinary" do
    AllYourBase.rebase(16, [2, 10], 3).should eq([1, 1, 2, 0])
  end

  pending "15-bit integer" do
    AllYourBase.rebase(97, [3, 46, 60], 73).should eq([6, 10, 45])
  end

  pending "empty list" do
    AllYourBase.rebase(2, [] of Int32, 10).should eq([0])
  end

  pending "single zero" do
    AllYourBase.rebase(10, [0], 2).should eq([0])
  end

  pending "multiple zeros" do
    AllYourBase.rebase(10, [0, 0, 0], 2).should eq([0])
  end

  pending "leading zeros" do
    AllYourBase.rebase(7, [0, 6, 0], 10).should eq([4, 2])
  end

  pending "input base is one" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(1, [0], 10)
    end
  end

  pending "input base is zero" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(0, [] of Int32, 10)
    end
  end

  pending "input base is negative" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(-2, [1], 10)
    end
  end

  pending "negative digit" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1, -1, 1, 0, 1, 0], 10)
    end
  end

  pending "invalid positive digit" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1, 2, 1, 0, 1, 0], 10)
    end
  end

  pending "output base is one" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1, 0, 1, 0, 1, 0], 1)
    end
  end

  pending "output base is zero" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(10, [7], 0)
    end
  end

  pending "output base is negative" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(2, [1], -7)
    end
  end

  pending "both bases are negative" do
    expect_raises(ArgumentError) do
      AllYourBase.rebase(-2, [1], -7)
    end
  end
end
