module Series
  extend self

  def slices(series : String, slice_length : Number) : Array(String)
    if slice_length < 1 || slice_length > series.size
      raise ArgumentError.new "invalid slice length"
    end

    substrings = [] of String
    until series.size < slice_length
      substrings << series[0..slice_length - 1]
      series = series[1..-1]
    end
    substrings
  end
end
