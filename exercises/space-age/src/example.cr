module SpaceAge
  extend self

  @@times = {
    "Earth"   => 31557600,
    "Mercury" => 7600543.81,
    "Venus"   => 19411026.17,
    "Mars"    => 59359776.78,
    "Jupiter" => 374222565.14,
    "Saturn"  => 928792569.65,
    "Uranus"  => 2652994591.73,
    "Neptune" => 5196280668.35,
  } of String => Float64

  def age(planet : String, seconds : Int32) : Float64
    (seconds / @@times[planet]).round(2)
  end
end
