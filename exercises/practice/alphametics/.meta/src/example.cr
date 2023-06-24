module Alphametics
  def self.solve(puzzle : String) : Hash(String, Int32)
    recur(equations(puzzle), leading_chars(puzzle), Hash(String, Int32).new, (0..9).to_a, 0) || Hash(String, Int32).new
  end

  record Equation, letters : Array(String), addends : Hash(String, Int32), result : String

  def self.recur(eqs, leading_chars, current_map, available, carry)
    return current_map if eqs.empty? && carry.zero?

    remaining_letters = eqs[0].letters - current_map.keys

    available.permutations(remaining_letters.size).each do |coefficients|
      map = remaining_letters.zip(coefficients).to_h

      next if leading_chars.any? { |c| map[c]? && map[c] == 0 }

      map.merge!(current_map)
      value = eqs[0].addends.map { |addend, count| map[addend] * count }.sum + carry

      if value % 10 == map[eqs[0].result]
        if result = recur(eqs[1..-1], leading_chars, map, available - map.values, value // 10)
          return result
        end
      end
    end

    nil
  end

  def self.leading_chars(puzzle)
    (" " + puzzle).scan(/ ([A-Z])/).map { |s| s[1] }.uniq
  end

  def self.equations(puzzle)
    addends, result = puzzle.split("==")
    addends = addends.split("+").map { |a| a.strip.chars.map(&.to_s).reverse }
    result = result.strip.chars.map(&.to_s).reverse

    (0...result.size).map do |i|
      column_addends = addends.compact_map(&.[i]?).tally
      Equation.new((column_addends.keys + [result[i]]).uniq, column_addends, result[i])
    end
  end
end
