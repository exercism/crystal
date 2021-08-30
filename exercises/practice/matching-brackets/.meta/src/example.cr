module MatchingBrackets
  extend self
  MAP = {'}' => '{', ']' => '[', ')' => '('}

  def valid?(str : String)
    create_stack(filter_brackets(str)).size == 0
  end

  private def filter_brackets(brackets : String) : Array(Char)
    brackets.chars.select { |c| (MAP.keys + MAP.values).includes?(c) }
  end

  private def create_stack(brackets : Array(Char)) : Array(Char)
    brackets.reduce([] of Char) do |stack, b|
      MAP[b]? && MAP[b]? == stack.last? ? stack[0..-2] : stack << b
    end
  end
end
