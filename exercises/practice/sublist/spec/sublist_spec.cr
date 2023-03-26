require "spec"
require "../src/*"

describe "Sublist" do
  it "empty lists" do
    Sublist.classify([] of Int32, [] of Int32).should eq(Sublist::Classification::Equal)
  end

  pending "empty list within non empty list" do
    Sublist.classify([] of Int32, [1, 2, 3] of Int32).should eq(Sublist::Classification::Sublist)
  end

  pending "non empty list contains empty list" do
    Sublist.classify([1, 2, 3] of Int32, [] of Int32).should eq(Sublist::Classification::Superlist)
  end

  pending "list equals itself" do
    Sublist.classify([1, 2, 3] of Int32, [1, 2, 3] of Int32).should eq(Sublist::Classification::Equal)
  end

  pending "different lists" do
    Sublist.classify([1, 2, 3] of Int32, [2, 3, 4] of Int32).should eq(Sublist::Classification::Unequal)
  end

  pending "false start" do
    Sublist.classify([1, 2, 5] of Int32, [0, 1, 2, 3, 1, 2, 5, 6] of Int32).should eq(Sublist::Classification::Sublist)
  end

  pending "consecutive" do
    Sublist.classify([1, 1, 2] of Int32, [0, 1, 1, 1, 2, 1, 2] of Int32).should eq(Sublist::Classification::Sublist)
  end

  pending "sublist at start" do
    Sublist.classify([0, 1, 2] of Int32, [0, 1, 2, 3, 4, 5] of Int32).should eq(Sublist::Classification::Sublist)
  end

  pending "sublist in middle" do
    Sublist.classify([2, 3, 4] of Int32, [0, 1, 2, 3, 4, 5] of Int32).should eq(Sublist::Classification::Sublist)
  end

  pending "sublist at end" do
    Sublist.classify([3, 4, 5] of Int32, [0, 1, 2, 3, 4, 5] of Int32).should eq(Sublist::Classification::Sublist)
  end

  pending "at start of superlist" do
    Sublist.classify([0, 1, 2, 3, 4, 5] of Int32, [0, 1, 2] of Int32).should eq(Sublist::Classification::Superlist)
  end

  pending "in middle of superlist" do
    Sublist.classify([0, 1, 2, 3, 4, 5] of Int32, [2, 3] of Int32).should eq(Sublist::Classification::Superlist)
  end

  pending "at end of superlist" do
    Sublist.classify([0, 1, 2, 3, 4, 5] of Int32, [3, 4, 5] of Int32).should eq(Sublist::Classification::Superlist)
  end

  pending "first list missing element from second list" do
    Sublist.classify([1, 3] of Int32, [1, 2, 3] of Int32).should eq(Sublist::Classification::Unequal)
  end

  pending "second list missing element from first list" do
    Sublist.classify([1, 2, 3] of Int32, [1, 3] of Int32).should eq(Sublist::Classification::Unequal)
  end

  pending "first list missing additional digits from second list" do
    Sublist.classify([1, 2] of Int32, [1, 22] of Int32).should eq(Sublist::Classification::Unequal)
  end

  pending "order matters to a list" do
    Sublist.classify([1, 2, 3] of Int32, [3, 2, 1] of Int32).should eq(Sublist::Classification::Unequal)
  end

  pending "same digits but different numbers" do
    Sublist.classify([1, 0, 1] of Int32, [10, 1] of Int32).should eq(Sublist::Classification::Unequal)
  end
end
