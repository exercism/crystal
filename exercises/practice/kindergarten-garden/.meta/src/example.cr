class KindergartenGarden
  def initialize(@diagram : String)
  end

  def plants(student)
    i = students.index!(student)
    @diagram.split("\n").map do |row|
      row[(2 * i)..(2 * i + 1)]
    end.join.chars.map { |char| plant(char) }
  end

  private def students
    [
      "Alice",
      "Bob",
      "Charlie",
      "David",
      "Eve",
      "Fred",
      "Ginny",
      "Harriet",
      "Ileana",
      "Joseph",
      "Kincaid",
      "Larry",
    ]
  end

  private def plant(char)
    {
      'C' => "clover",
      'G' => "grass",
      'R' => "radishes",
      'V' => "violets",
    }[char]
  end
end
