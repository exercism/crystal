class WeighingMachine
  getter precision : Int32
  setter metric : Bool
  property weight : Float64 = 0.0

  def initialize(precision : Int32, metric : Bool = true)
    @precision = precision
    @metric = metric
  end

  # DO NOT MODIFY ANYTHING BELOW THIS LINE
  def weigh : String
    weight = @metric ? @weight : @weight * 2.20462
    weight = weight.round(@precision)
    weight.to_s
  end
end
