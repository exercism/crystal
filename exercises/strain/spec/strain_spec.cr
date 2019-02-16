require "spec"
require "../src/*"

describe "Strain" do
  it "keeps on empty array returns empty array" do
    g = [] of Int32
    g.keep { |e| e < 10 }.should eq([] of Int32)
  end

  pending "keeps everything" do
    [1, 2, 3].keep { |e| e < 10 }.should eq([1, 2, 3])
  end

  pending "keeps first and last" do
    [1, 2, 3].keep { |e| e % 2 == 1 }.should eq([1, 3])
  end

  pending "keeps neither first nor last" do
    [1, 2, 3].keep { |e| e % 2 == 0 }.should eq([2])
  end

  pending "keeps strings" do
    words = ["apple", "zebra", "banana", "zombies", "cherimoya", "zelot"]
    words.keep { |w| w.starts_with?('z') }.should eq(["zebra", "zombies", "zelot"])
  end

  pending "keep arrays" do
    rows = [
      [1, 2, 3],
      [5, 5, 5],
      [5, 1, 2],
      [2, 1, 2],
      [1, 5, 2],
      [2, 2, 1],
      [1, 2, 5],
    ]
    result = rows.keep { |row| row.includes?(5) }
    result.should eq([[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]])
  end

  pending "discard on empty array returns empty array" do
    g = [] of Int32
    g.discard { |e| e < 10 }.should eq([] of Int32)
  end

  pending "discard nothing" do
    [1, 2, 3].discard { |e| e > 10 }.should eq([1, 2, 3])
  end

  pending "discard first and last" do
    [1, 2, 3].discard { |e| e % 2 == 0 }.should eq([1, 3])
  end

  pending "discard the first and last" do
    [1, 2, 3].discard { |e| e % 2 == 1 }.should eq([2])
  end

  pending "discard strings" do
    words = ["apple", "zebra", "banana", "zombies", "cherimoya", "zelot"]
    words.discard { |w| w.starts_with?('z') }.should eq(["apple", "banana", "cherimoya"])
  end

  pending "discard arrays" do
    rows = [
      [1, 2, 3],
      [5, 5, 5],
      [5, 1, 2],
      [2, 1, 2],
      [1, 5, 2],
      [2, 2, 1],
      [1, 2, 5],
    ]
    result = rows.discard { |row| row.includes?(5) }
    result.should eq([[1, 2, 3], [2, 1, 2], [2, 2, 1]])
  end
end
