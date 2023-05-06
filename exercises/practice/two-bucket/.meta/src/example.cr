module TwoBucket
  enum Bucket
    One
    Two
  end

  struct Result
    property moves, other_bucket, goal_bucket

    def initialize(moves : UInt32, @other_bucket : UInt32, @goal_bucket : Bucket)
    end
  end

  def self.measure(bucket_one : UInt32, bucket_two : UInt32, goal : UInt32, start_bucket : Bucket)
    bucket_1 = BucketModel.new(bucket_one)
    bucket_2 = BucketModel.new(bucket_two)
    start = start_bucket == Bucket::One ? bucket_1 : bucket_2
    other = start_bucket == Bucket::Two ? bucket_1 : bucket_2

    previous_states = Set(Tuple(UInt32, UInt32)).new

    start.fill
    moves : UInt32 = 1

    while !(start.contains?(goal) || other.contains?(goal))
      current_state = {start.current, other.current}
      raise ArgumentError.new if previous_states.includes?(current_state)
      previous_states.add(current_state)

      moves += 1

      if other.size == goal
        other.fill
      elsif other.full?
        other.empty
      elsif !start.empty?
        start.pour_into(other)
      else
        start.fill
      end
    end

    Result.new(
      moves: moves,
      other_bucket: bucket_1.contains?(goal) ? bucket_2.current : bucket_1.current,
      goal_bucket: bucket_1.contains?(goal) ? Bucket::One : Bucket::Two
    )
  end

  private class BucketModel
    property current : UInt32
    getter size : UInt32

    def initialize(@size)
      @current = 0
    end

    def empty
      @current = 0
    end

    def empty?
      @current == 0
    end

    def full?
      @current == @size
    end

    def fill
      @current = @size
    end

    def pour_into(other : BucketModel)
      amount = [@current, other.capacity].min
      @current -= amount
      other.current += amount
    end

    def capacity
      @size - @current
    end

    def contains?(amount : UInt32)
      @current == amount
    end
  end
end
