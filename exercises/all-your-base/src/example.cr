module AllYourBase
  extend self

  private def convert_to_input_base(digits : Array(Int32), base : Int32) : Int32
    digits.reverse.map_with_index { |n, i| n * base**i }.sum
  end

  private def convert_to_output_base(number : Int32, base : Int32) : Array(Int32)
    result = [] of Int32
    while number >= base
      result << number % base
      number /= base
    end
    result << number % base
    result.reverse
  end

  def rebase(input_base : Int32, digits : Array(Int32), output_base : Int32) : Array(Int32)
    raise ArgumentError.new "Invalid input base." if input_base < 2
    raise ArgumentError.new "Invalid output base." if output_base < 2

    return [0] unless digits.any?

    if digits.any? { |d| d < 0 || d >= input_base }
      raise ArgumentError.new "Invalid input digit."
    end

    number = convert_to_input_base(digits, input_base)
    convert_to_output_base(number, output_base)
  end
end
