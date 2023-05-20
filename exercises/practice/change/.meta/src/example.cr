module Change
  def self.find_fewest_coins(target : Int32, coins : Array(Int32)) : Array(Int32)
    fewest_coins = recur(target, Int32::MAX, coins, [] of Int32)
    raise ArgumentError.new if fewest_coins.nil?
    fewest_coins
  end

  private def self.recur(target : Int32, coin_limit : Int32, coins : Array(Int32), current : Array(Int32)) : Array(Int32)?
    return current if target == 0
    return if coins.empty?
    return if current.size + target / coins[-1] > coin_limit

    change = nil

    coins.select(&.<= target).reverse.each do |value|
      ((target / value).to_i..1).step(-1).each do |number_taken|
        candidate = recur(
          target - value * number_taken,
          coin_limit,
          coins.reject(&.>= value),
          ([value] * number_taken) + current
        )

        if candidate && candidate.size <= coin_limit
          change = candidate
          coin_limit = change.size
        end
      end
    end

    change
  end
end
