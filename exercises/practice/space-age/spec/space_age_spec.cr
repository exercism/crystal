require "spec"
require "../src/*"

describe "SpaceAge" do
  it "age on Earth" do
    Space::Age.from_seconds(1000000000).age_on_earth.should be_close(31.69, 0.01)
  end

  pending "age on Mercury" do
    Space::Age.from_seconds(2134835688).age_on_mercury.should be_close(280.88, 0.01)
  end

  pending "age on Venus" do
    Space::Age.from_seconds(189839836).age_on_venus.should be_close(9.78, 0.01)
  end

  pending "age on Mars" do
    Space::Age.from_seconds(2129871239).age_on_mars.should be_close(35.88, 0.01)
  end

  pending "age on Jupiter" do
    Space::Age.from_seconds(901876382).age_on_jupiter.should be_close(2.41, 0.01)
  end

  pending "age on Saturn" do
    Space::Age.from_seconds(2000000000).age_on_saturn.should be_close(2.15, 0.01)
  end

  pending "age on Uranus" do
    Space::Age.from_seconds(1210123456).age_on_uranus.should be_close(0.46, 0.01)
  end

  pending "age on Neptune" do
    Space::Age.from_seconds(1821023456).age_on_neptune.should be_close(0.35, 0.01)
  end
end
