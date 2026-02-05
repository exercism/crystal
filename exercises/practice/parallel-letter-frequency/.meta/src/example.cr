class ParallelLetterFrequency
  def self.calculate_frequencies(input : Array(String)) : Hash(String, Int32)
    frequencies = Hash(String, Int32).new(0)
    channel = Channel(Hash(String, Int32)).new

    input.each do |text|
      spawn do
        local = Hash(String, Int32).new(0)
        processed = 0

        text.each_char do |char|
          next unless char.letter?
          local[char.downcase.to_s] += 1

          # Crystal fibers are cooperatively scheduled; yielding occasionally
          # prevents one long-running fiber from starving the others.
        end
        channel.send(local)
      end
    end
    input.size.times do |x|
      hash = channel.receive
      frequencies.merge!(hash) do |key, oldval, newval|
        oldval + newval
      end
    end
    frequencies
  end
end
