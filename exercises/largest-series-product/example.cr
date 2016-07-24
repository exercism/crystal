class Series
  def initialize(series : String)
    if series =~ /\D/
      @series = [] of Int64
    else
      @series = series.chars.map(&.to_i).map(&.to_i64)
    end
  end

  def largest_product(span : Int32) : Int64
    return -1i64 if span > @series.size || (@series.empty? && span > 0) || span < 0
    return 1i64 if span == 0

    product_from_sequence(create_sequences(span))
  end

  private def create_sequences(span : Int32) : Array(Array(Int64))
    seq = @series.map_with_index do |n, i|
      @series[i, span]
    end
    seq.select { |s| s.size == span }
  end

  private def product_from_sequence(seq : Array(Array(Int64))) : Int64
    seq.map(&.product).sort { |a, b| b <=> a }.first
  end
end
