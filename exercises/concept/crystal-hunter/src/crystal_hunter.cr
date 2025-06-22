class Rules
  def bonus_points?(power_up_active, touching_bandit)
    power_up_active && touching_bandit
  end

  def score?(touching_power_up, touching_crystal)
    touching_power_up || touching_crystal
  end

  def lose?(power_up_active, touching_bandit)
    !power_up_active && touching_bandit
  end

  def win?(has_picked_up_all_crystals, power_up_active, touching_bandit)
    has_picked_up_all_crystals && !lose?(power_up_active, touching_bandit)
  end
end
