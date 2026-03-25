module PerfectNumbers
  extend self

  def classify(num : Number) : String
    raise ArgumentError.new "Classification is only possible for natural numbers." if num <= 0

    aliquot_sum = (1..num - 1)
      .select { |n| num % n == 0 }
      .sum

    aliquot_sum == num ? "perfect" : aliquot_sum < num ? "deficient" : "abundant"
  end
end
