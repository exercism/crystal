module RunLengthEncoding
  extend self

  def encode(str)
    reader = Char::Reader.new(str)
    String.build do |io|
      while reader.has_next?
        count = 1

        while reader.current_char == reader.peek_next_char
          count += 1
          reader.next_char
        end

        io << count if count > 1
        io << reader.current_char
        reader.next_char
      end
    end
  end

  def decode(str)
    reader = Char::Reader.new(str)
    String.build do |io|
      while reader.has_next?
        num = 0

        while reader.current_char.number?
          num *= 10
          num += reader.current_char.to_i
          reader.next_char
        end

        io << reader.current_char if num == 0
        num.times { |i| io << reader.current_char }
        reader.next_char
      end
    end
  end
end
