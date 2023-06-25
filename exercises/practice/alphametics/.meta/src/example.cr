module Alphametics
  def self.solve(puzzle : String) : Hash(Char, Int32)
    recur(equations(puzzle), leading_chars(puzzle), Hash(Char, Int32).new, (0..9).to_a, 0) || Hash(Char, Int32).new
  end

  record Equation, letters : Array(Char), addends : Hash(Char, Int32), result : Char

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
    (" " + puzzle).scan(/ ([A-Z])/).map { |s| s[1][0] }.uniq
  end

  def self.equations(puzzle)
    addends, result = puzzle.split("==")
    addends = addends.split("+").map { |a| a.strip.chars.reverse }
    result = result.strip.chars.reverse

    (0...result.size).map do |i|
      column_addends = addends.compact_map(&.[i]?).tally
      Equation.new((column_addends.keys + [result[i]]).uniq, column_addends, result[i])
    end
  end
end
