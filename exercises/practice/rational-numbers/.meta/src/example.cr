module RationalNumbers
  alias Rational = Tuple(Int32, Int32)

  def self.add(r1 : Rational, r2 : Rational) : Rational
    reduce({r1[0] * r2[1] + r2[0] * r1[1], r1[1] * r2[1]})
  end

  def self.sub(r1 : Rational, r2 : Rational) : Rational
    reduce({r1[0] * r2[1] - r2[0] * r1[1], r1[1] * r2[1]})
  end

  def self.mul(r1 : Rational, r2 : Rational) : Rational
    reduce({r1[0] * r2[0], r1[1] * r2[1]})
  end

  def self.div(r1 : Rational, r2 : Rational) : Rational
    mul(r1, {r2[1], r2[0]})
  end

  def self.abs(r : Rational) : Rational
    reduce({r[0].abs, r[1].abs})
  end

  def self.exp(r : Rational, n : Int32) : Rational
    r = {r[0] ** n.abs, r[1] ** n.abs}
    reduce(n.negative? ? {r[1], r[0]} : r)
  end

  def self.exp(x : Int32, r : Rational) : Float64
    x.to_f64 ** (r[0].to_f64 / r[1].to_f64)
  end

  def self.reduce(r : Rational) : Rational
    gcd = r[0].gcd(r[1])
    r = {(r[0] / gcd).to_i32, (r[1] / gcd).to_i32}
    r[1].negative? ? {-r[0], -r[1]} : r
  end
end
