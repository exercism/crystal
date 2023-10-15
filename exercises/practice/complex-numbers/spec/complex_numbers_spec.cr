require "spec"
require "../src/*"

describe "ComplexNumbers" do
  it "Real part of a purely real number" do
    Complex.new(1, 0).real.should be_close 1, 1e-9
  end

  pending "Real part of a purely imaginary number" do
    Complex.new(0, 1).real.should be_close 0, 1e-9
  end

  pending "Real part of a number with real and imaginary part" do
    Complex.new(1, 2).real.should be_close 1, 1e-9
  end

  pending "Imaginary part of a purely real number" do
    Complex.new(1, 0).imaginary.should be_close 0, 1e-9
  end

  pending "Imaginary part of a purely imaginary number" do
    Complex.new(0, 1).imaginary.should be_close 1, 1e-9
  end

  pending "Imaginary part of a number with real and imaginary part" do
    Complex.new(1, 2).imaginary.should be_close 2, 1e-9
  end

  pending "Imaginary unit" do
    (Complex.new(0, 1) * Complex.new(0, 1)).should be_close Complex.new(-1, 0), 1e-9
  end

  pending "Add purely real numbers" do
    (Complex.new(1, 0) + Complex.new(2, 0)).should be_close Complex.new(3, 0), 1e-9
  end

  pending "Add purely imaginary numbers" do
    (Complex.new(0, 1) + Complex.new(0, 2)).should be_close Complex.new(0, 3), 1e-9
  end

  pending "Add numbers with real and imaginary part" do
    (Complex.new(1, 2) + Complex.new(3, 4)).should be_close Complex.new(4, 6), 1e-9
  end

  pending "Subtract purely real numbers" do
    (Complex.new(1, 0) - Complex.new(2, 0)).should be_close Complex.new(-1, 0), 1e-9
  end

  pending "Subtract purely imaginary numbers" do
    (Complex.new(0, 1) - Complex.new(0, 2)).should be_close Complex.new(0, -1), 1e-9
  end

  pending "Subtract numbers with real and imaginary part" do
    (Complex.new(1, 2) - Complex.new(3, 4)).should be_close Complex.new(-2, -2), 1e-9
  end

  pending "Multiply purely real numbers" do
    (Complex.new(1, 0) * Complex.new(2, 0)).should be_close Complex.new(2, 0), 1e-9
  end

  pending "Multiply purely imaginary numbers" do
    (Complex.new(0, 1) * Complex.new(0, 2)).should be_close Complex.new(-2, 0), 1e-9
  end

  pending "Multiply numbers with real and imaginary part" do
    (Complex.new(1, 2) * Complex.new(3, 4)).should be_close Complex.new(-5, 10), 1e-9
  end

  pending "Divide purely real numbers" do
    (Complex.new(1, 0) / Complex.new(2, 0)).should be_close Complex.new(0.5, 0), 1e-9
  end

  pending "Divide purely imaginary numbers" do
    (Complex.new(0, 1) / Complex.new(0, 2)).should be_close Complex.new(0.5, 0), 1e-9
  end

  pending "Divide numbers with real and imaginary part" do
    (Complex.new(1, 2) / Complex.new(3, 4)).should be_close Complex.new(0.44, 0.08), 1e-9
  end

  pending "Absolute value of a positive purely real number" do
    Complex.new(5, 0).abs.should be_close 5, 1e-9
  end

  pending "Absolute value of a negative purely real number" do
    Complex.new(-5, 0).abs.should be_close 5, 1e-9
  end

  pending "Absolute value of a purely imaginary number with positive imaginary part" do
    Complex.new(0, 5).abs.should be_close 5, 1e-9
  end

  pending "Absolute value of a purely imaginary number with negative imaginary part" do
    Complex.new(0, -5).abs.should be_close 5, 1e-9
  end

  pending "Absolute value of a number with real and imaginary part" do
    Complex.new(3, 4).abs.should be_close 5, 1e-9
  end

  pending "Conjugate a purely real number" do
    Complex.new(5, 0).conjugate.should be_close Complex.new(5, 0), 1e-9
  end

  pending "Conjugate a purely imaginary number" do
    Complex.new(0, 5).conjugate.should be_close Complex.new(0, -5), 1e-9
  end

  pending "Conjugate a number with real and imaginary part" do
    Complex.new(1, 1).conjugate.should be_close Complex.new(1, -1), 1e-9
  end

  pending "Euler's identity/formula" do
    Complex.new(0, Math::PI).exp.should be_close Complex.new(-1, 0), 1e-9
  end

  pending "Exponential of 0" do
    Complex.new(0, 0).exp.should be_close Complex.new(1, 0), 1e-9
  end

  pending "Exponential of a purely real number" do
    Complex.new(1, 0).exp.should be_close Complex.new(Math::E, 0), 1e-9
  end

  pending "Exponential of a number with real and imaginary part" do
    Complex.new(Math.log(2), Math::PI).exp.should be_close Complex.new(-2, 0), 1e-9
  end

  pending "Exponential resulting in a number with real and imaginary part" do
    Complex.new(Math.log(2)/2, Math::PI/4).exp.should be_close Complex.new(1, 1), 1e-9
  end

  pending "Add real number to complex number" do
    (Complex.new(1, 2) + 5).should be_close Complex.new(6, 2), 1e-9
  end

  pending "Add complex number to real number" do
    (5 + Complex.new(1, 2)).should be_close Complex.new(6, 2), 1e-9
  end

  pending "Subtract real number from complex number" do
    (Complex.new(5, 7) - 4).should be_close Complex.new(1, 7), 1e-9
  end

  pending "Subtract complex number from real number" do
    (4 - Complex.new(5, 7)).should be_close Complex.new(-1, -7), 1e-9
  end

  pending "Multiply complex number by real number" do
    (Complex.new(2, 5) * 5).should be_close Complex.new(10, 25), 1e-9
  end

  pending "Multiply real number by complex number" do
    (5 * Complex.new(2, 5)).should be_close Complex.new(10, 25), 1e-9
  end

  pending "Divide complex number by real number" do
    (Complex.new(10, 100) / 10).should be_close Complex.new(1, 10), 1e-9
  end

  pending "Divide real number by complex number" do
    (5 / Complex.new(1, 1)).should be_close Complex.new(2.5, -2.5), 1e-9
  end
end
