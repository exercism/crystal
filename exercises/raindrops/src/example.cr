class Raindrops
  def self.convert(num : Int32)
    drops = String.build do |str|
      str << "Pling" if num % 3 == 0
      str << "Plang" if num % 5 == 0
      str << "Plong" if num % 7 == 0
    end
    drops.empty? ? num.to_s : drops
  end
end
