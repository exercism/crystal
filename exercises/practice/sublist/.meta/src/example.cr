module Sublist
  enum Classification
    Equal
    Unequal
    Sublist
    Superlist
  end

  def self.classify(list1 : Array(Int32), list2 : Array(Int32)) : Classification
    list1 = as_string(list1)
    list2 = as_string(list2)

    case {list1.includes?(list2), list2.includes?(list1)}
    when {false, false}
      Classification::Unequal
    when {false, true}
      Classification::Sublist
    when {true, false}
      Classification::Superlist
    else
      Classification::Equal
    end
  end

  private def self.as_string(list : Array(Int32)) : String
    list.map { |x| ":#{x}:" }.join
  end
end
