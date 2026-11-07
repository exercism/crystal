# This file includes functions that are made for exclusive use by individual templates.
#

module GeneratorPlugins
  def to_s_deep(input : JSON::Any) : String
    case input
    when .as_i64?
      input.as_i64.to_s
    when .as_f?
      input.as_f.to_s
    when .as_bool?
      input.as_bool.to_s
    when .as_a?
      elements = input.as_a.map { |element| to_s_deep(element) }.join(", ")
      "[#{elements}]"
    when .as_h?
      pairs = input.as_h.map do |key, value|
        "\"#{key}\"=> #{to_s_deep(value)}"
      end.join(", ")
      "{#{pairs}}"
    when .as_s?
      "\"#{input}\""
    else
      "nil"
    end
  end

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

  def list_ops_array(input : JSON::Any) : String
    if input.as_a.empty?
      "[] of Int32"
    else
      to_s_deep(input)
    end
  end

  def list_ops_nestable(input : JSON::Any) : String
    if input.as_a.empty?
      "[] of Array(Int32)"
    else
      to_s_deep(input).gsub("[]", "[] of Int32")
    end
  end

  # Converts the input function to a proc for the list ops exercise
  def list_ops_function(input : JSON::Any, arg_types : Array(String))
    func_string = input.to_s

    # Add types to the arguments to the proc
    args_match = func_string.match(/^\((.*)\)\s*->/)
    if args_match && !args_match.captures.empty?
      if args_match.captures[0]
        typed_args = args_match.captures[0].as(String).split(",").map_with_index { |elem, i| "#{elem.strip}: #{arg_types[i]}" }.join(", ")
      else
        typed_args = ""
      end
      func_string = func_string.gsub(args_match[0], "->(#{typed_args}) {") + " }"
    end

    func_string.gsub("modulo", "%")
  end
end
