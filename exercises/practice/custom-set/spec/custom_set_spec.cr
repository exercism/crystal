require "spec"
require "../src/*"

describe "CustomSet" do
  it "sets with no elements are empty" do
    custom_set = CustomSet.new([] of Int32)
    custom_set.empty?.should be_true
  end

  pending "sets with elements are not empty" do
    custom_set = CustomSet.new([1])
    custom_set.empty?.should be_false
  end

  pending "nothing is contained in an empty set" do
    custom_set = CustomSet.new([] of Int32)
    custom_set.contains?(1).should be_false
  end

  pending "when the element is in the set" do
    custom_set = CustomSet.new([1, 2, 3])
    custom_set.contains?(1).should be_true
  end

  pending "when the element is not in the set" do
    custom_set = CustomSet.new([1, 2, 3])
    custom_set.contains?(4).should be_false
  end

  pending "empty set is a subset of another empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([] of Int32)
    custom_set1.subset?(custom_set2).should be_true
  end

  pending "empty set is a subset of non-empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([1])
    custom_set1.subset?(custom_set2).should be_true
  end

  pending "non-empty set is not a subset of empty set" do
    custom_set1 = CustomSet.new([1])
    custom_set2 = CustomSet.new([] of Int32)
    custom_set1.subset?(custom_set2).should be_false
  end

  pending "set is a subset of set with exact same elements" do
    custom_set1 = CustomSet.new([1, 2, 3])
    custom_set2 = CustomSet.new([1, 2, 3])
    custom_set1.subset?(custom_set2).should be_true
  end

  pending "set is a subset of larger set with same elements" do
    custom_set1 = CustomSet.new([1, 2, 3])
    custom_set2 = CustomSet.new([4, 1, 2, 3])
    custom_set1.subset?(custom_set2).should be_true
  end

  pending "set is not a subset of set that does not contain its elements" do
    custom_set1 = CustomSet.new([1, 2, 3])
    custom_set2 = CustomSet.new([4, 1, 3])
    custom_set1.subset?(custom_set2).should be_false
  end

  pending "the empty set is disjoint with itself" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([] of Int32)
    custom_set1.disjoint?(custom_set2).should be_true
  end

  pending "empty set is disjoint with non-empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([1])
    custom_set1.disjoint?(custom_set2).should be_true
  end

  pending "non-empty set is disjoint with empty set" do
    custom_set1 = CustomSet.new([1])
    custom_set2 = CustomSet.new([] of Int32)
    custom_set1.disjoint?(custom_set2).should be_true
  end

  pending "sets are not disjoint if they share an element" do
    custom_set1 = CustomSet.new([1, 2])
    custom_set2 = CustomSet.new([2, 3])
    custom_set1.disjoint?(custom_set2).should be_false
  end

  pending "sets are disjoint if they share no elements" do
    custom_set1 = CustomSet.new([1, 2])
    custom_set2 = CustomSet.new([3, 4])
    custom_set1.disjoint?(custom_set2).should be_true
  end

  pending "empty sets are equal" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([] of Int32)
    custom_set1.equal?(custom_set2).should be_true
  end

  pending "empty set is not equal to non-empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([1, 2, 3])
    custom_set1.equal?(custom_set2).should be_false
  end

  pending "non-empty set is not equal to empty set" do
    custom_set1 = CustomSet.new([1, 2, 3])
    custom_set2 = CustomSet.new([] of Int32)
    custom_set1.equal?(custom_set2).should be_false
  end

  pending "sets with the same elements are equal" do
    custom_set1 = CustomSet.new([1, 2])
    custom_set2 = CustomSet.new([2, 1])
    custom_set1.equal?(custom_set2).should be_true
  end

  pending "sets with different elements are not equal" do
    custom_set1 = CustomSet.new([1, 2, 3])
    custom_set2 = CustomSet.new([1, 2, 4])
    custom_set1.equal?(custom_set2).should be_false
  end

  pending "set is not equal to larger set with same elements" do
    custom_set1 = CustomSet.new([1, 2, 3])
    custom_set2 = CustomSet.new([1, 2, 3, 4])
    custom_set1.equal?(custom_set2).should be_false
  end

  pending "set is equal to a set constructed from an array with duplicates" do
    custom_set1 = CustomSet.new([1])
    custom_set2 = CustomSet.new([1, 1])
    custom_set1.equal?(custom_set2).should be_true
  end

  pending "add to empty set" do
    custom_set = CustomSet.new([] of Int32)
    expected = CustomSet.new([3])
    custom_set.add(3).should eq(expected)
  end

  pending "add to non-empty set" do
    custom_set = CustomSet.new([1, 2, 4])
    expected = CustomSet.new([1, 2, 3, 4])
    custom_set.add(3).should eq(expected)
  end

  pending "adding an existing element does not change the set" do
    custom_set = CustomSet.new([1, 2, 3])
    expected = CustomSet.new([1, 2, 3])
    custom_set.add(3).should eq(expected)
  end

  pending "intersection of two empty sets is an empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([] of Int32)
    expected = CustomSet.new([] of Int32)
    custom_set1.intersection(custom_set2).should eq(expected)
  end

  pending "intersection of an empty set and non-empty set is an empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([3, 2, 5])
    expected = CustomSet.new([] of Int32)
    custom_set1.intersection(custom_set2).should eq(expected)
  end

  pending "intersection of a non-empty set and an empty set is an empty set" do
    custom_set1 = CustomSet.new([1, 2, 3, 4])
    custom_set2 = CustomSet.new([] of Int32)
    expected = CustomSet.new([] of Int32)
    custom_set1.intersection(custom_set2).should eq(expected)
  end

  pending "intersection of two sets with no shared elements is an empty set" do
    custom_set1 = CustomSet.new([1, 2, 3])
    custom_set2 = CustomSet.new([4, 5, 6])
    expected = CustomSet.new([] of Int32)
    custom_set1.intersection(custom_set2).should eq(expected)
  end

  pending "intersection of two sets with shared elements is a set of the shared elements" do
    custom_set1 = CustomSet.new([1, 2, 3, 4])
    custom_set2 = CustomSet.new([3, 2, 5])
    expected = CustomSet.new([2, 3])
    custom_set1.intersection(custom_set2).should eq(expected)
  end

  pending "difference of two empty sets is an empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([] of Int32)
    expected = CustomSet.new([] of Int32)
    custom_set1.difference(custom_set2).should eq(expected)
  end

  pending "difference of empty set and non-empty set is an empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([3, 2, 5])
    expected = CustomSet.new([] of Int32)
    custom_set1.difference(custom_set2).should eq(expected)
  end

  pending "difference of a non-empty set and an empty set is the non-empty set" do
    custom_set1 = CustomSet.new([1, 2, 3, 4])
    custom_set2 = CustomSet.new([] of Int32)
    expected = CustomSet.new([1, 2, 3, 4])
    custom_set1.difference(custom_set2).should eq(expected)
  end

  pending "difference of two non-empty sets is a set of elements that are only in the first set" do
    custom_set1 = CustomSet.new([3, 2, 1])
    custom_set2 = CustomSet.new([2, 4])
    expected = CustomSet.new([1, 3])
    custom_set1.difference(custom_set2).should eq(expected)
  end

  pending "difference removes all duplicates in the first set" do
    custom_set1 = CustomSet.new([1, 1])
    custom_set2 = CustomSet.new([1])
    expected = CustomSet.new([] of Int32)
    custom_set1.difference(custom_set2).should eq(expected)
  end

  pending "union of empty sets is an empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([] of Int32)
    expected = CustomSet.new([] of Int32)
    custom_set1.union(custom_set2).should eq(expected)
  end

  pending "union of an empty set and non-empty set is the non-empty set" do
    custom_set1 = CustomSet.new([] of Int32)
    custom_set2 = CustomSet.new([2])
    expected = CustomSet.new([2])
    custom_set1.union(custom_set2).should eq(expected)
  end

  pending "union of a non-empty set and empty set is the non-empty set" do
    custom_set1 = CustomSet.new([1, 3])
    custom_set2 = CustomSet.new([] of Int32)
    expected = CustomSet.new([1, 3])
    custom_set1.union(custom_set2).should eq(expected)
  end

  pending "union of non-empty sets contains all unique elements" do
    custom_set1 = CustomSet.new([1, 3])
    custom_set2 = CustomSet.new([2, 3])
    expected = CustomSet.new([3, 2, 1])
    custom_set1.union(custom_set2).should eq(expected)
  end
end
