module ScaleGenerator
  def self.chromatic(tonic)
    scale = chromatic_scale(tonic)
    scale.rotate(scale.index(tonic.capitalize).as(Int))
  end

  def self.interval(tonic, intervals)
    pitches_from_intervals(tonic, intervals)
  end

  private def self.chromatic_scale(tonic)
    if uses_flats? tonic
      %w(C Db D Eb E F Gb G Ab A Bb B)
    else
      %w(C C# D D# E F F# G G# A A# B)
    end
  end

  private def self.uses_flats?(tonic)
    %w(F Bb Eb Ab Db Gb d g c f bb eb).includes? tonic
  end

  private def self.pitches_from_intervals(tonic, intervals)
    tones = chromatic(tonic)
    scale = [tones[0]]
    intervals.chars[0..-1].each do |step|
      tones.rotate!(step_size step)
      scale.push tones[0]
    end
    scale
  end

  private def self.step_size(step)
    {
      'A' => 3,
      'M' => 2,
      'm' => 1,
    }[step]
  end
end
