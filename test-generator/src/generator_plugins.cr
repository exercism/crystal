# This file includes functions that are made for exclusive use by individual templates.
#

module GeneratorPlugins
  def to_cammel(input : String)
    result = ""
    input = input.capitalize
    capitalized = false
    input.each_char do |character|
      if character == '-'
        capitalized = true
      else
        result += capitalized ? character.upcase : character
        capitalized = false
      end
    end
    result
  end

  def binary_search_tree(tree, last = [] of String) : String
    if tree.as_h?
      result = ""
      return "" if tree == nil
      if tree["data"]?
        if last.size == 0
          result += "tree.value.should eq(#{tree["data"]})\n"
        elsif last.size == 1
          result += "#{last[-1]} = tree.#{last[-1]}.not_nil!
          #{last[-1]}.value.should eq(#{tree["data"]})\n"
        else
          result += "#{last.join("_")} = #{last[...-1].join("_")}.#{last[-1]}.not_nil!
          #{last.join("_")}.value.should eq(#{tree["data"]})\n"
        end
      end
      if tree["left"]?
        result += binary_search_tree(tree["left"], [*last, "left"])
      end
      if tree["right"]?
        result += binary_search_tree(tree["right"], [*last, "right"])
      end
      result
    else
      ""
    end
  end

  def strain(function : String) : String
    if function[9..].includes?("contains")
        return "x.includes?(5)"
    elsif function[9..].includes?("starts_with")
        return "x.starts_with?('z')"
    end
    function[9..]
  end
end
