class Combinations
  private getter sum, size, exclude

  def initialize(@sum : Int32, @size : Int32, @exclude : Array(Int32))
  end

  def solve : Array(Array(Int32))
    candidates = (1..[sum, 9].min).to_a
      .reject { |c| exclude.includes?(c) }

    candidates.combinations(size)
      .select { |c| c.sum == sum }
      .to_a
  end
end
