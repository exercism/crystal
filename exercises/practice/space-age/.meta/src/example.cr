module Space
  struct Age
    SECONDS_PER_EARTH_YEAR = 31557600
    EARTH_YEARS_ON_PLANET  = {
      mercury: 0.2408467,
      venus:   0.61519726,
      mars:    1.8808158,
      jupiter: 11.862615,
      saturn:  29.447498,
      uranus:  84.016846,
      neptune: 164.79132,
    }

    {% for planet, conv_fact in EARTH_YEARS_ON_PLANET %}
      def age_on_{{planet.id}}
        @years / {{conv_fact}}
      end
    {% end %}

    def age_on_earth
      @years
    end

    def Age.from_seconds(seconds : Int32) : Age
      new years: (seconds.to_f / SECONDS_PER_EARTH_YEAR)
    end

    def initialize(@years : Float64); end
  end
end
