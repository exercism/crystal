module Secrets
  def shift_back(value : UInt8, numberOfPlaces : UInt8) : UInt8
    value << numberOfPlaces
  end

  def apply_mask(value : UInt8, mask : UInt8) : UInt8
    value & mask
  end

  def set_bits(value1 : UInt8, value2 : UInt8) : UInt8
    value1 | value2
  end

  def reverse_xor(value : UInt8, agreedValue : UInt8) : UInt8
    value ^ ~agreedValue
  end
end
