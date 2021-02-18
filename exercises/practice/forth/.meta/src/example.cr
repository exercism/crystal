class Token
  property type : Symbol
  property string_value : String
  property int_value : Int32

  def initialize
    @type = :EOF
    @string_value = ""
    @int_value = 0_i32
  end

  def eof?
    type == :EOF
  end
end

class Lexer
  getter reader
  getter token

  def initialize(code : String)
    @reader = Char::Reader.new(code)
    @token = Token.new
  end

  def create_token
    @token = Token.new unless @token.eof?
  end

  def next_token
    create_token
    skip_whitespace
    case current_char
    when '\0'
      @token.type = :EOF
    when ':'
      next_char :":"
    when ';'
      next_char :";"
    when .number?
      @token.type = :INT
      consume_number
    else
      @token.type = :WORD
      consume_string
    end

    @token
  end

  private def consume_string
    start_pos = current_pos

    while valid_word_char?
      next_char
    end

    @token.string_value = reader.string.byte_slice(start_pos, current_pos - start_pos)
  end

  private def consume_number
    integer = 0

    while '0' <= current_char <= '9'
      integer *= 10
      integer += current_char.to_i
      next_char
    end

    @token.int_value = integer
  end

  private def next_char(token_type)
    @token.type = token_type
    next_char
  end

  private def current_pos
    reader.pos
  end

  private def skip_whitespace
    while current_char.whitespace? || current_char.control?
      break unless reader.has_next?
      next_char
    end
  end

  private def valid_word_char?
    !current_char.number? && !current_char.whitespace? && !(current_char == '\0')
  end

  private delegate current_char, to: @reader
  private delegate next_char, to: @reader
end

class Forth
  def self.evaluate(code_string)
    new(code_string).evaluate
  end

  def initialize(code_string)
    @lexer = Lexer.new(code_string)
    @stack = Array(Int32).new
    @defs = Hash(String, Array(Token)).new
  end

  def evaluate
    loop do
      evaluate_token(next_token)
      return stack if token.eof?
    end
  end

  private def evaluate_token(t)
    case t.type
    when :INT
      parse_number(t)
    when :WORD
      parse_word(t)
    when :":"
      parse_def
    when :EOF
      return
    else
      raise "Unexpected Token!"
    end
  end

  private def parse_number(t)
    stack.push(t.int_value)
  end

  private def parse_word(t)
    if defs[t.string_value.upcase]?
      return defs[t.string_value.upcase].each { |t| evaluate_token(t) }
    end

    case t.string_value.upcase
    when "+"
      pop_twice { |a, b| stack.push(b + a) }
    when "-"
      pop_twice { |a, b| stack.push(b - a) }
    when "*"
      pop_twice { |a, b| stack.push(b * a) }
    when "/"
      pop_twice { |a, b| stack.push(b // a) }
    when "DUP"
      pop_once { |a| stack.push(a).push(a) }
    when "DROP"
      pop_once { }
    when "SWAP"
      pop_twice { |a, b| stack.push(a).push(b) }
    when "OVER"
      pop_twice { |a, b| stack.push(b).push(a).push(b) }
    else
      raise "Unknown word"
    end
  end

  private def parse_def
    next_token
    raise "Invalid method name" if token.type == :INT
    name = token.string_value.upcase
    defs[name] = [] of Token
    while next_token
      raise "Invalid Definition" if token.type == :EOF
      break if token.type == :";"
      defs[name] << token
    end
  end

  private def pop_once(&block)
    raise "Invalid program" if stack.empty?
    yield(stack.pop)
  end

  private def pop_twice(&block)
    raise "Invalid program" if stack.size < 2
    yield(stack.pop, stack.pop)
  end

  private property defs
  private getter stack
  private delegate token, to: @lexer
  private delegate next_token, to: @lexer
end
