module Dominoes
  def self.can_chain(dominoes : Array(Array(Int32)))
    return true if dominoes.empty?
    dominoes[1..].permutations.uniq.each do |permutation|
      return true if recur(dominoes.first[1], permutation, dominoes.first[0])
    end
    false
  end

  private def self.recur(left : Int32, dominoes : Array(Array(Int32)), right : Int32)
    if dominoes.empty?
      return left == right
    end

    [dominoes.first, dominoes.first.reverse].each do |domino|
      if domino[0] == left
        return true if recur(domino[1], dominoes[1..], right)
      end
    end

    false
  end
end
