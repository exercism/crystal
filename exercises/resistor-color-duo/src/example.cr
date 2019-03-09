module ResistorColorDuo
  extend self

  enum Color
    Black
    Brown
    Red
    Orange
    Yellow
    Green
    Blue
    Violet
    Grey
    White
  end

  def value(values : Array(String)) : Number
    values.map { |c| Color.parse(c).value }.join.to_i
  end
end
