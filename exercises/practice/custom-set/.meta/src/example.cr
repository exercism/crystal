struct CustomSet
  @elements : Hash(Int32, Nil)

  getter elements

  def initialize(elements : Array(Int32))
    @elements = elements.to_h { |element| {element, nil} }
  end

  def empty?
    @elements.empty?
  end

  def contains?(element)
    @elements.has_key?(element)
  end

  def subset?(other)
    @elements.all? { |element, _| other.contains?(element) }
  end

  def disjoint?(other)
    @elements.none? { |element, _| other.contains?(element) }
  end

  def equal?(other)
    @elements.size == other.elements.size && subset?(other)
  end

  def add(element)
    @elements[element] = nil
    self
  end

  def ==(other)
    equal?(other)
  end

  def intersection(other)
    @elements.select! { |element, _| other.contains?(element) }
    self
  end

  def difference(other)
    @elements.reject! { |element, _| other.contains?(element) }
    self
  end

  def union(other)
    other.elements.each { |element, _| add(element) }
    self
  end
end
