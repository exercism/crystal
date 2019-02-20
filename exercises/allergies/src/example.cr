module Allergies
  extend self

  SUBSTANCES = ["eggs",
                "peanuts",
                "shellfish",
                "strawberries",
                "tomatoes",
                "chocolate",
                "pollen",
                "cats"]

  def allergic_to(substance : String, score : Int32) : Bool
    substance_index = SUBSTANCES.index(substance)
    substance_index ? ((score >> substance_index) & 1) == 1 : false
  end

  def list(score : Int32) : Array(String)
    SUBSTANCES.select { |s| allergic_to(s, score) }
  end
end
