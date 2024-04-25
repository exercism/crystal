# Instructions

The weather station of Wellington is going to replace its manual temperature recording system with a new digital one.
In the old system, the calculations were performed manually.
In the new system, they will be automated.
The calculations include converting the temperature from Celsius to Fahrenheit, and finding the average temperature.
The new system has sensors to record temperature data in Celsius.

The Wellington weather station wants you to help them with the new system.

## 1. Convert the temperature from Celsius to Kelvin

The weather station has a section on its website that is specified for researchers.
The researchers are interested in the temperature in Kelvin.

Kelvin is a unit of measurement for temperature.
It has the same scale as Celsius, but with a different starting point.
Its starting point is absolute zero, which is 0K (Kelvin) or -273.15°C (Celsius).

Here is a table showing the conversion between Celsius and Kelvin:

| Celsius(°C) | Kelvin(K) |
| ----------- | --------- |
| -273.15     | 0         |
| -100        | 173.15    |
| 0           | 273.15    |
| 100         | 373.15    |

The weather station wants you to implement a method that converts a temperature from Celsius to Kelvin.

Implement the `Temperature#to_kelvin` method that takes an argument `celsius` and returns the temperature in Kelvin by adding 273.15 to the given `celsius` value.

```crystal
Temperature.new.to_kelvin(0)
# => 273.15
```

## 2. Round the temperature

The weather station temperature sensor is very precise.
It can measure the temperature to the nearest 0.0001°C.
The weather station only wants to display the temperature rounded to 1 decimal place since most users are not interested in that level of precision.

The weather station would thereby like you to implement a method that rounds the temperature to 1 decimal place.

Implement the `Temperature#round` method that takes an argument `celsius` and returns the temperature rounded to 1 decimal place.

```crystal
Temperature.new.round(10.1234)
# => 10.1

Temperature.new.round(10.1567)
# => 10.2
```

## 3. Convert the temperature from Celsius to Fahrenheit

The weather station has a section on its website that is specified for tourists.
The tourists are interested in the temperature in Fahrenheit.

Fahrenheit is a unit of measurement for temperature.
It has a different scale than Celsius.
0°C is 32°F, and 1 degree Celsius is equal to 1.8 degrees Fahrenheit.

Here is a table showing the conversion between Celsius and Fahrenheit:

| Celsius(°C) | Fahrenheit(°F) |
| ----------- | -------------- |
| -273.15     | -459.8         |
| -100        | -148            |
| 0           | 32             |
| 100         | 212            |

The weather station wants you to implement a method that converts a temperature from Celsius to Fahrenheit.

Implement the `Temperature#to_fahrenheit` method that takes an argument `celsius` and returns the temperature in Fahrenheit as an integer.

```crystal
Temperature.new.to_fahrenheit(10)
# => 50
```

## 4. Get the number of missing sensors

During the installation of the temperature sensors, the maintenance workers realized some sensors were missing.
Each temperature measurement unit requires 4 temperature sensors.
The maintenance team counted how many sensors they had, but they do not know how many sensors are missing.
They would like to get some help counting how many sensors they need to buy to build another complete temperature measurement unit.

Implement the `Temperature#number_missing_sensors` method that takes an argument `number_of_sensors` and returns the number of missing sensors.

```crystal
Temperature.new.number_missing_sensors(10)
# => 2
```
