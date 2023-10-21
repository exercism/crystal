class Reactor
  def self.criticality_balanced?(temperature, neutrons_emitted)
    output = temperature * neutrons_emitted
    return temperature < 800 && neutrons_emitted > 500 && output < 500000
  end

  def self.reactor_efficiency(voltage, current, theoretical_max_power)
    generated_power = voltage * current
    percentage_range = (generated_power / theoretical_max_power) * 100

    if 80 <= percentage_range <= 100
      return "green"
    elsif 60 <= percentage_range < 80
      return "orange"
    elsif 30 <= percentage_range < 60
      return "red"
    else
      return "black"
    end
  end

  def self.fail_safe(temperature, neutrons_produced_per_second, threshold)
    output = temperature * neutrons_produced_per_second
    operational_percentage = (output / threshold) * 100

    if operational_percentage < 90
      return "LOW"
    elsif operational_percentage <= 110
      return "NORMAL"
    else
      return "DANGER"
    end
  end
end
