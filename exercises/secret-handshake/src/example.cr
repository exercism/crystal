module SecretHandshake
  extend self

  SIGNAL               = ["wink", "double blink", "close your eyes", "jump"]
  REVERSE_BIT_POSITION = 4

  private def bitset?(position : Number, number : Number) : Bool
    ((number >> position) & 1) == 1
  end

  def commands(input : Number) : Array(String)
    handshake = [] of String
    SIGNAL.each_with_index do |h, i|
      handshake << h if bitset?(i, input)
    end

    bitset?(REVERSE_BIT_POSITION, input) ? handshake.reverse : handshake
  end
end
