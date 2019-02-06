module CollatzConjecture
  extend self

  def steps(input : Number) : Number
    raise ArgumentError.new "Only positive numbers are allowed" if input < 1

    n = input
    steps = 0
    until n == 1
      if n % 2 == 0
        n = n / 2
      else
        n = 3 * n + 1
      end

      steps = steps + 1
    end

    steps
  end
end
