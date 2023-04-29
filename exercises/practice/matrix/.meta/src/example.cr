class Matrix
  @rows : Array(Array(Int32))

  def initialize(s : String)
    @rows = s.split("\n").map(&.split(" ").map(&.to_i))
  end

  def row(which : UInt32) : Array(Int32)
    @rows[which - 1]
  end

  def column(which : UInt32) : Array(Int32)
    @rows.map(&.[which - 1])
  end
end
