require "sync/shared"

class ParallelLetterFrequency
  def self.calculate_frequencies(input : Array(String)) : Hash(String, Int32)
    data : Sync::Shared(Hash(String, Int32)) = Sync::Shared.new({} of String => Int32)
    channel = Channel(Nil).new
    input.each do |text|
      spawn do
        local = Hash(String, Int32).new(0)

        text.each_char do |char|
          next unless char.letter?
          local[char.downcase.to_s] += 1
        end

        data.replace do |shared_data|
          local.each do |char, count|
            shared_data[char] ||= 0
            shared_data[char] += count
          end
          shared_data
        end
        channel.send(nil) # signal completion
      end
    end

    input.size.times do
      channel.receive
    end

    data.get
  end
end
