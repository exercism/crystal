class Complex
  getter real, imaginary

  def initialize(@real : Float64, @imaginary : Float64)
  end

  def +(other : Complex)
    self.class.new(
      @real + other.real,
      @imaginary + other.imaginary
    )
  end

  def +(f : Float64)
    self + self.class.new(f, 0)
  end

  def -(other : Complex)
    self.class.new(
      @real - other.real,
      @imaginary - other.imaginary
    )
  end

  def -(f : Float64)
    self - self.class.new(f, 0)
  end

  def *(other : Complex)
    self.class.new(
      @real * other.real - @imaginary * other.imaginary,
      @real * other.imaginary + @imaginary * other.real
    )
  end

  def *(f : Float64)
    self * self.class.new(f, 0)
  end

  def /(other : Complex)
    self.class.new(
      (real * other.real + imaginary * other.imaginary) / (other.real ** 2 + other.imaginary ** 2),
      (imaginary * other.real - real * other.imaginary) / (other.real ** 2 + other.imaginary ** 2)
    )
  end

  def /(f : Float64)
    self / self.class.new(f, 0)
  end

  def abs
    Math.sqrt(real ** 2 + imaginary ** 2)
  end

  def conjugate
    self.class.new(real, -imaginary)
  end

  def exp
    self.class.new(Math.exp(real), 0) * self.class.new(Math.cos(imaginary), Math.sin(imaginary))
  end

  def ==(other : Complex)
    (real - other.real).abs < 1e-9 && (imaginary - other.imaginary).abs < 1e-9
  end
end

struct Number
  def +(complex : Complex)
    Complex.new(self, 0) + complex
  end

  def -(complex : Complex)
    Complex.new(self, 0) - complex
  end

  def *(complex : Complex)
    Complex.new(self, 0) * complex
  end

  def /(complex : Complex)
    Complex.new(self, 0) / complex
  end
end
