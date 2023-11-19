module Secrets
  def self.shift_back(value : UInt8, number_of_places : UInt8) : UInt8
    raise "Please implement the Secrets.shift_back method"
  end

  def self.apply_mask(value : UInt8, mask : UInt8) : UInt8
    raise "Please implement the Secrets.apply_mask method"
  end

  def self.set_bits(value1 : UInt8, value2 : UInt8) : UInt8
    raise "Please implement the Secrets.set_bits method"
  end

  def self.reverse_xor(value : UInt8, agreed_value : UInt8) : UInt8
    raise "Please implement the Secrets.reverse_xor method"
  end
end
