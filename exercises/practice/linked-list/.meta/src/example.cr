class LinkedList
  class Node
    getter value
    property :next, prev

    @next : Node? = nil
    @prev : Node? = nil

    def initialize(@value : Int32)
    end
  end

  @head : Node? = nil
  @tail : Node? = nil
  @count : UInt32 = 0

  getter count

  def push(value : Int32)
    if @tail.nil?
      @tail = Node.new(value)
      @head = @tail
    else
      node = Node.new(value)
      @tail.not_nil!.next = node
      node.prev = @tail
      @tail = node
    end

    @count += 1
  end

  def pop
    if popped = @tail
      @tail = popped.prev
      @head = nil if @tail.nil?
      if prev = popped.prev
        prev.next = nil
      end

      @count -= 1

      popped.value
    end
  end

  def unshift(value : Int32)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      node = Node.new(value)
      @head.not_nil!.prev = node
      node.next = @head
      @head = node
    end

    @count += 1
  end

  def shift
    if shifted = @head
      @head = shifted.next
      @tail = nil if @head.nil?
      if _next = shifted.next
        _next.prev = nil
      end

      @count -= 1

      shifted.value
    end
  end

  def delete(value : Int32)
    current = @head

    while node = current
      if node.value == value
        if _next = node.next
          _next.prev = node.prev
        end
        if prev = node.prev
          prev.next = node.next
        end
        if @head == node
          @head = node.next
        end
        if @tail == node
          @tail = node.prev
        end

        @count -= 1

        return
      end

      current = node.next
    end
  end
end
