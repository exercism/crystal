class CircularBuffer
  @count : UInt32
  @head : UInt32
  @tail : UInt32

  def initialize(@capacity : UInt32)
    @buffer = Array(Int32).new(capacity, 0)
    @count = 0
    @head = @tail = 0
  end

  def read
    raise RuntimeError.new if @count == 0

    v = @buffer[@tail]
    @tail = (@tail + 1) % @capacity
    @count -= 1
    v
  end

  def write(v : Int32)
    raise RuntimeError.new if @count == @capacity

    overwrite(v)
  end

  def overwrite(v : Int32)
    @buffer[@head] = v
    @head = (@head + 1) % @capacity

    if @count == @capacity
      @tail = @head
    else
      @count += 1
    end
  end

  def clear
    @count = 0
    @head = @tail = 0
  end
end
