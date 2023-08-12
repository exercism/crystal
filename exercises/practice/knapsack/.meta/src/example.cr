module Knapsack
  def self.maximum_value(maximum_weight : Int32, items : Array(NamedTuple(weight: Int32, value: Int32)))
    table = Array.new(items.size + 1) { Array.new(maximum_weight + 1, 0) }

    items.each_with_index do |item, i|
      (1..maximum_weight).each do |capacity|
        weight, value = item[:weight], item[:value]

        if weight > capacity
          table[i + 1][capacity] = table[i][capacity]
        else
          table[i + 1][capacity] = [table[i][capacity], value + table[i][capacity - weight]].max
        end
      end
    end

    table[items.size][maximum_weight]
  end
end
