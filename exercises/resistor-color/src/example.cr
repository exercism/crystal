module ResistorColor
  extend self

  COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]

  def color_code(color : String) : Int32 | Nil
    COLORS.index(color)
  end

  def colors
    COLORS
  end
end
