module PythagoreanTriplet
  def self.triplets_with_sum(sum : Int32) : Array(Array(Int32))
    triplets = [] of Array(Int32)

    (1...(sum / 3)).each do |a|
      ((a + 1)...((sum - a) / 2)).each do |b|
        c = sum - (a + b)
        if a ** 2 + b ** 2 == c ** 2
          triplets.push([a, b, c])
        end
      end
    end

    triplets
  end
end
