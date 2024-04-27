class ZebraPuzzle
  HOUSES = [1, 2, 3, 4, 5] of UInt8
  @red : UInt8 = 0
  @green : UInt8 = 0
  @ivory : UInt8 = 0
  @yellow : UInt8 = 0
  @blue : UInt8 = 0
  @kools : UInt8 = 0
  @old_gold : UInt8 = 0
  @chesterfield : UInt8 = 0
  @lucky_strike : UInt8 = 0
  @parliament : UInt8 = 0
  @coffee : UInt8 = 0
  @tea : UInt8 = 0
  @milk : UInt8 = 0
  @orange_juice : UInt8 = 0
  @water : UInt8 = 0
  @englishman : UInt8 = 0
  @spaniard : UInt8 = 0
  @ukrainian : UInt8 = 0
  @norwegian : UInt8 = 0
  @japanese : UInt8 = 0
  @dog : UInt8 = 0
  @fox : UInt8 = 0
  @horse : UInt8 = 0
  @zebra : UInt8 = 0
  @snails : UInt8 = 0

  def initialize
    iterator = HOUSES.each_permutation(5)
    while !(sequence = iterator.next).is_a?(Iterator::Stop)
      @red = sequence[0]
      @green = sequence[1]
      @ivory = sequence[2]
      @yellow = sequence[3]
      @blue = sequence[4]

      if @green != @ivory + 1
        next
      end

      if solve_nationality()
        break
      end
    end
  end

  private def solve_nationality
    @norwegian = 1

    iterator = ([2, 3, 4, 5] of UInt8).each_permutation(4)
    while !(sequence = iterator.next).is_a?(Iterator::Stop)
      @englishman = sequence[0]
      @spaniard = sequence[1]
      @ukrainian = sequence[2]
      @japanese = sequence[3]

      if @englishman != @red
        next
      end

      if !neighbors?(@norwegian, @blue)
        next
      end

      if solve_drinks()
        return true
      end
    end
    return false
  end

  private def solve_drinks
    @milk = 3

    iterator = ([1, 2, 4, 5] of UInt8).each_permutation(4)
    while !(sequence = iterator.next).is_a?(Iterator::Stop)
      @coffee = sequence[0]
      @tea = sequence[1]
      @orange_juice = sequence[2]
      @water = sequence[3]

      if @coffee != @green
        next
      end

      if @tea != @ukrainian
        next
      end

      if solve_smokes()
        return true
      end
    end
    return false
  end

  private def solve_smokes
    iterator = HOUSES.each_permutation(5)
    while !(sequence = iterator.next).is_a?(Iterator::Stop)
      @kools = sequence[0]
      @old_gold = sequence[1]
      @chesterfield = sequence[2]
      @lucky_strike = sequence[3]
      @parliament = sequence[4]

      if @kools != @yellow
        next
      end

      if @lucky_strike != @orange_juice
        next
      end

      if @parliament != @japanese
        next
      end

      if solve_pets()
        return true
      end
    end

    return false
  end

  private def solve_pets
    iterator = HOUSES.each_permutation(5)
    while !(sequence = iterator.next).is_a?(Iterator::Stop)
      @dog = sequence[0]
      @fox = sequence[1]
      @horse = sequence[2]
      @zebra = sequence[3]
      @snails = sequence[4]

      if @dog != @spaniard
        next
      end

      if @snails != @old_gold
        next
      end

      if !neighbors?(@fox, @chesterfield)
        next
      end

      if !neighbors?(@horse, @kools)
        next
      end

      return true
    end
    return false
  end

  private def neighbors?(first : UInt8, second : UInt8)
    first == second + 1 || first + 1 == second
  end

  def drinks_water
    who?(@water)
  end

  def owns_zebra
    who?(@zebra)
  end

  private def who?(house : UInt8)
    case house
    when @englishman
      "Englishman"
    when @spaniard
      "Spaniard"
    when @ukrainian
      "Ukrainian"
    when @norwegian
      "Norwegian"
    when @japanese
      "Japanese"
    end
  end
end
