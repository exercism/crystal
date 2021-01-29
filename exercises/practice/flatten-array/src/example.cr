module FlattenArray
  extend self

  def flatten(arr)
    arr.flatten.compact
  end
end
