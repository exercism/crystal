class ListOps(T)
  def append(list1 : Array(T), list2 : Array(T)) : Array(T)
    concat([list1, list2])
  end

  def concat(lists : Array(Array(T)))
    result = [] of T
    lists.each { |sublist|
      sublist.each { |elem| result << elem }
    }
    result
  end

  def filter(list : Array(T), function : T -> Bool) : Array(T)
    filtered = [] of T
    list.each { |elem|
      if function.call(elem)
        filtered << elem
      end
    }
    filtered
  end

  def length(list : Array(T)) : Int
    count = 0
    list.each { |_| count = count + 1 }
    count
  end

  def map(list : Array(T), function : T -> _)
    mapped = [] of T
    list.each { |elem| mapped << function.call(elem) }
    mapped
  end

  def foldl(list : Array(T), initial : _, function : _, T -> _)
    acc = initial
    list.each { |elem| acc = function.call(acc, elem) }
    acc
  end

  def foldr(list : Array(T), initial : _, function : _, T -> _)
    acc = initial
    copy = list.clone
    until copy.empty?
      acc = function.call(acc, copy.pop)
    end
    acc
  end

  def reverse(list : Array(T)) : Array(T)
    reversed = [] of T
    copy = list.clone
    until copy.empty?
      reversed << copy.pop
    end
    reversed
  end
end
