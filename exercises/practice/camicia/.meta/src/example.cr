class Camicia
  @past_decks = [] of Tuple(Array(String), Array(String), String, Array(String))
  @current : String = "A"
  @pile : Array(String) = [] of String

  def initialize(player_a : Array(String), player_b : Array(String))
    @player_a = player_a
    @player_b = player_b
  end

  def simulate_game : NamedTuple(status: String, moves: Int32, tricks: Int32)
    penalty = 0
    tricks = 0
    moves = 0
    until loop?
      past_decks_tuple = Tuple.new(@player_a.clone, @player_b.clone, @current, @pile.clone)
      @past_decks << past_decks_tuple
      if @current == "A" && penalty > 0
        card = @player_a.shift
        @pile << card
        penalty -= 1
        if check_penelaty(card) != 0
          penalty = check_penelaty(card)
          @current = "B"
        elsif penalty == 0
          @player_b.concat(@pile)
          @pile = [] of String
          @current = "B"
          tricks += 1
          if @player_a.empty?
            moves += 1
            return {status: "finished", moves: moves, tricks: tricks}
          end
        end
      elsif @current == "B" && penalty > 0
        card = @player_b.shift
        penalty -= 1
        @pile << card
        if check_penelaty(card) != 0
          penalty = check_penelaty(card)
          @current = "A"
        elsif penalty == 0
          @player_a.concat(@pile)
          @pile = [] of String
          @current = "A"
          tricks += 1
          if @player_b.empty?
            moves += 1
            return {status: "finished", moves: moves, tricks: tricks}
          end
        end
      elsif @current == "A"
        card = @player_a.shift
        @pile << card
        penalty = check_penelaty(card)
        @current = "B"
      else
        card = @player_b.shift
        @pile << card
        penalty = check_penelaty(card)
        @current = "A"
      end

      moves += 1

      if (@player_a.empty? && @current == "A" || @player_b.empty? && @current == "B")
        tricks += 1
        return {status: "finished", moves: moves, tricks: tricks}
      end
    end
    return {status: "loop", moves: moves, tricks: tricks}
  end

  def loop? : Bool
    @past_decks.each do |past_deck|
      if past_deck[3] == @pile && past_deck[2] == @current && compare_decks(past_deck[0], @player_a) && compare_decks(past_deck[1], @player_b)
        return true
      end
    end
    return false
  end

  private def compare_decks(deck_a : Array(String), deck_b : Array(String)) : Bool
    if deck_a.size != deck_b.size
      return false
    end

    deck_a.each_with_index do |card, idx|
      if check_penelaty(card) != check_penelaty(deck_b[idx])
        return false
      end
    end

    return true
  end

  def check_penelaty(card : String) : Int
    case card
    when "A" then 4
    when "K" then 3
    when "Q" then 2
    when "J" then 1
    else          0
    end
  end
end
