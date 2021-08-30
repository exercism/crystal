class Array(T)
  def keep
    kept = Array(T).new
    each { |e| kept << e if yield(e) }
    kept
  end

  def discard
    keep { |e| !yield(e) }
  end
end
