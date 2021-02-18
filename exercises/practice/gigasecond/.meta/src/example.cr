module Gigasecond
  extend self

  def from(start : Time) : Time
    start + (10**9).seconds
  end
end
