class Temperature
  def to_kelvin(celsius)
    celsius + 273.15
  end

  def round(celsius)
    celsius.round(1)
  end

  def to_fahrenheit(celsius)
    ((celsius * 1.8) + 32).to_i
  end

  def number_missing_sensors(number_of_sensors)
    (4 - number_of_sensors) % 4
  end
end
