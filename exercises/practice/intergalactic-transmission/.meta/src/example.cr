class IntergalacticTransmission
  def self.transmit_sequence(message : Array(Int32))
    temp = [] of Int32
    result = [] of Int32
    i = 0
    while i < message.size || temp.size > 0
      if temp.size == 7 || i >= message.size
        p temp
        temp = expand_number(sum(temp.reverse!)).reverse!
        p temp
        temp.pop
        temp << (temp.sum.even? ? 0 : 1)
        result << sum(temp)
        temp.clear
      else
        expanded_number = expand_number(message[i])
        expanded_number = temp + expanded_number
        temp = expanded_number.pop(temp.size + 1)
        expanded_number << (expanded_number.sum.even? ? 0 : 1)
        result << sum(expanded_number)
        i += 1
      end
    end

    result
  end

  def self.sum(arr : Array(Int32))
    sum = 0
    arr.each_with_index do |num, i|
      sum += num * (2 ** (arr.size - 1 - i))
    end
    sum
  end

  def self.expand_number(num : Int32)
    current = [] of Int32
    (8 - num.bit_length).times do |_|
      current << 0
    end
    current.concat(num == 0 ? [] of Int32 : num.digits(2).reverse!)
    current
  end

  def self.decode_message(transmission : Array(Int32))
    result = [] of Int32
    temp = [] of Int32
    transmission.each do |num|
      expanded_number = expand_number(num)
      parity_bit = expanded_number.pop
      if parity_bit != (expanded_number.sum.even? ? 0 : 1)
        raise ArgumentError.new("Parity bit does not match the data")
      end

      temp.concat(expanded_number)
      if temp.size >= 8
        result << sum(temp.shift(8))
      end
    end

    result
  end
end
