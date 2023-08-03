class Bowling
  def initialize
    @frames = [] of Int32
    @current = [] of Int32
    @pins = 0
    reset_pins
  end

  def roll(pins)
    raise ArgumentError.new unless !done?
    raise ArgumentError.new unless (0..10).includes? pins
    raise ArgumentError.new unless pins <= @pins

    @current.push pins
    @pins -= pins
    reset_pins if @pins == 0

    if @current.size == 3 && strike?
      @frames.push @current.sum
      @current = @current[1..]
    end

    if @current.size == 3 && spare?
      @frames.push @current.sum
      @current = @current[2..]
    end

    if !done? && open? && @current.size == 2
      @frames.push @current.sum
      @current = [] of Int32
      reset_pins
    end
  end

  def score
    raise ArgumentError.new unless done?
    @frames.sum
  end

  private def reset_pins
    @pins = 10
  end

  private def spare?
    @current[0..1].sum == 10
  end

  private def strike?
    @current[0] == 10
  end

  private def open?
    !spare? && !strike?
  end

  private def done?
    @frames.size == 10
  end
end
