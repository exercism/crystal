class Reactor
  def self.is_criticality_balanced?(temperature, neutrons_emitted)
    raise "Please implement the Reactor.is_criticality_balanced? method"
  end

  def self.reactor_efficiency(voltage, current, theoretical_max_power)
    raise "Please implement the Reactor.reactor_efficiency method"
  end

  def self.fail_safe(temperature, neutrons_produced_per_second, threshold)
    raise "Please implement the Reactor.fail_safe method"
  end
end
