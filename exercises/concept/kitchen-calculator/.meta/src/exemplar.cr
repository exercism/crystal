module KitchenCalculator
  def self.get_volume(volume_pair)
    volume_pair[1]
  end

  def self.to_milliliter(volume_pair)
    case volume_pair[0]
    when :cup
      {:milliliter, volume_pair[1] * 240}
    when :fluid_ounce
      {:milliliter, volume_pair[1] * 30}
    when :teaspoon
      {:milliliter, volume_pair[1] * 5}
    when :tablespoon
      {:milliliter, volume_pair[1] * 15}
    else
      volume_pair
    end
  end

  def self.from_milliliter(volume_pair, unit)
    case unit
    when :cup
      {:cup, volume_pair[1] / 240}
    when :fluid_ounce
      {:fluid_ounce, volume_pair[1] / 30}
    when :teaspoon
      {:teaspoon, volume_pair[1] / 5}
    when :tablespoon
      {:tablespoon, volume_pair[1] / 15}
    else
      volume_pair
    end
  end

  def self.convert(volume_pair, unit)
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
