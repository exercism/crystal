require "spec"
require "../src/*"

describe "ListOps" do
  describe "append entries to a list and return the new list" do
    it "empty lists" do
      list_ops = ListOps(Int32).new
      list_ops.append([] of Int32, [] of Int32).should eq([] of Int32)
    end
    pending "list to empty list" do
      list_ops = ListOps(Int32).new
      list_ops.append([] of Int32, [1, 2, 3, 4]).should eq([1, 2, 3, 4])
    end
    pending "empty list to list" do
      list_ops = ListOps(Int32).new
      list_ops.append([1, 2, 3, 4], [] of Int32).should eq([1, 2, 3, 4])
    end
    pending "non-empty lists" do
      list_ops = ListOps(Int32).new
      list_ops.append([1, 2], [2, 3, 4, 5]).should eq([1, 2, 2, 3, 4, 5])
    end
  end
  describe "concatenate a list of lists" do
    pending "empty list" do
      list_ops = ListOps(Int32).new
      list_ops.concat([] of Array(Int32)).should eq([] of Int32)
    end
    pending "list of lists" do
      list_ops = ListOps(Int32).new
      list_ops.concat([[1, 2], [3], [] of Int32, [4, 5, 6]]).should eq([1, 2, 3, 4, 5, 6])
    end
    pending "list of nested lists" do
      list_ops = ListOps(Array(Int32)).new
      list_ops.concat([[[1], [2]], [[3]], [[] of Int32], [[4, 5, 6]]]).should eq([[1], [2], [3], [] of Int32, [4, 5, 6]])
    end
  end
  describe "filter list returning only values that satisfy the filter function" do
    pending "empty list" do
      list_ops = ListOps(Int32).new
      filter = ->(x : Int32) { x % 2 == 1 }
      list_ops.filter([] of Int32, filter).should eq([] of Int32)
    end
    pending "non-empty list" do
      list_ops = ListOps(Int32).new
      filter = ->(x : Int32) { x % 2 == 1 }
      list_ops.filter([1, 2, 3, 5], filter).should eq([1, 3, 5])
    end
  end
  describe "returns the length of a list" do
    pending "empty list" do
      list_ops = ListOps(Int32).new
      list_ops.length([] of Int32).should eq(0)
    end
    pending "non-empty list" do
      list_ops = ListOps(Int32).new
      list_ops.length([1, 2, 3, 4]).should eq(4)
    end
  end
  describe "return a list of elements whose values equal the list value transformed by the mapping function" do
    pending "empty list" do
      list_ops = ListOps(Int32).new
      mapper = ->(x : Int32) { x + 1 }
      list_ops.map([] of Int32, mapper).should eq([] of Int32)
    end
    pending "non-empty list" do
      list_ops = ListOps(Int32).new
      mapper = ->(x : Int32) { x + 1 }
      list_ops.map([1, 3, 5, 7], mapper).should eq([2, 4, 6, 8])
    end
  end
  describe "folds (reduces) the given list from the left with a function" do
    pending "empty list" do
      list_ops = ListOps(Int32).new
      folder = ->(acc : Int32, el : Int32) { el * acc }
      list_ops.foldl([] of Int32, 2, folder).should eq(2)
    end
    pending "direction independent function applied to non-empty list" do
      list_ops = ListOps(Int32).new
      folder = ->(acc : Int32, el : Int32) { el + acc }
      list_ops.foldl([1, 2, 3, 4], 5, folder).should eq(15)
    end
    pending "direction dependent function applied to non-empty list" do
      list_ops = ListOps(Int32).new
      folder = ->(acc : Float64, el : Int32) { el / acc }
      list_ops.foldl([1, 2, 3, 4], 24.to_f64, folder).should eq(64.to_f64)
    end
  end
  describe "folds (reduces) the given list from the right with a function" do
    pending "empty list" do
      list_ops = ListOps(Int32).new
      folder = ->(acc : Int32, el : Int32) { el * acc }
      list_ops.foldr([] of Int32, 2, folder).should eq(2)
    end
    pending "direction independent function applied to non-empty list" do
      list_ops = ListOps(Int32).new
      folder = ->(acc : Int32, el : Int32) { el + acc }
      list_ops.foldr([1, 2, 3, 4], 5, folder).should eq(15)
    end
    pending "direction dependent function applied to non-empty list" do
      list_ops = ListOps(Int32).new
      folder = ->(acc : Float64, el : Int32) { el / acc }
      list_ops.foldr([1, 2, 3, 4], 24.to_f64, folder).should eq(9.to_f64)
    end
  end
  describe "reverse the elements of the list" do
    pending "empty list" do
      list_ops = ListOps(Int32).new
      list_ops.reverse([] of Int32).should eq([] of Int32)
    end
    pending "non-empty list" do
      list_ops = ListOps(Int32).new
      list_ops.reverse([1, 3, 5, 7]).should eq([7, 5, 3, 1])
    end
    pending "list of lists is not flattened" do
      list_ops = ListOps(Array(Int32)).new
      list_ops.reverse([[1, 2], [3], [] of Int32, [4, 5, 6]]).should eq([[4, 5, 6], [] of Int32, [3], [1, 2]])
    end
  end
end
