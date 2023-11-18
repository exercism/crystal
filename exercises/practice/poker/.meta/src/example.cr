module Poker
  def self.best_hands(hands)
    hands = hands.map { |hand| Hand.new(hand) }
    max_score = hands.map(&.score).max
    hands.select { |hand| hand.score == max_score }.map(&.to_s)
  end
end

class Poker::Hand
  @cards : Array(Card)
  @s : String

  def initialize(@s)
    @cards = @s.split.map { |card| Card.new(card) }
  end

  def to_s
    @s
  end

  def score
    straight_flush ||
      straight_flush_ace_low ||
      four_of_a_kind ||
      full_house ||
      flush ||
      straight ||
      straight_ace_low ||
      three_of_a_kind ||
      two_pair ||
      pair ||
      high_card
  end

  private def partitioned_by_rank
    @cards.group_by { |card| card.rank }.values
  end

  private def partitioned_by_suit
    @cards.group_by { |card| card.suit }.values
  end

  private def sorted_by_rank(cards = @cards)
    cards.sort_by { |card| card.rank }.reverse
  end

  private def sorted_by_rank_ace_low
    @cards.sort_by { |card| card.rank_ace_low }.reverse
  end

  private def base_score(type)
    {
      :high_card       => 1,
      :pair            => 2,
      :two_pair        => 3,
      :three_of_a_kind => 4,
      :straight        => 5,
      :flush           => 6,
      :full_house      => 7,
      :four_of_a_kind  => 8,
      :straight_flush  => 9,
    }[type]
  end

  private def fractional_score(cards, rank_type = :rank)
    ranks = rank_type == :rank_ace_low ? cards.map(&.rank_ace_low) : cards.map(&.rank)
    ranks += [0, 0, 0, 0, 0]
    [
      ranks[0] * 0.01,
      ranks[1] * 0.00_01,
      ranks[2] * 0.00_00_01,
      ranks[3] * 0.00_00_00_01,
      ranks[4] * 0.00_00_00_00_01,
    ].sum
  end

  private def high_card
    base_score(:high_card) + fractional_score(sorted_by_rank)
  end

  private def pair
    pairs = partitioned_by_rank.select { |p| p.size == 2 }

    if pairs.size == 1
      everything_else = partitioned_by_rank.select { |p| p.size == 1 }.flatten
      base_score(:pair) + fractional_score([pairs.first.first, *sorted_by_rank(everything_else)])
    end
  end

  private def two_pair
    pairs = partitioned_by_rank.select { |p| p.size == 2 }

    if pairs.size == 2
      everything_else = partitioned_by_rank.select { |p| p.size == 1 }.flatten
      pair_ranks = pairs.flatten.map(&.rank)
      base_score(:two_pair) + fractional_score([
        pairs.flatten.max_by { |c| c.rank },
        pairs.flatten.min_by { |c| c.rank },
        *sorted_by_rank(everything_else),
      ])
    end
  end

  private def three_of_a_kind
    triples = partitioned_by_rank.select { |p| p.size == 3 }

    if triples.size == 1
      everything_else = partitioned_by_rank.select { |p| p.size == 1 }.flatten
      base_score(:three_of_a_kind) + fractional_score([triples.first.first, *sorted_by_rank(everything_else)])
    end
  end

  private def straight
    cards = sorted_by_rank

    if cards.each_cons(2).all? { |pair| pair[1].rank + 1 == pair[0].rank }
      return base_score(:straight) + fractional_score([cards.last])
    end
  end

  private def straight_ace_low
    cards = sorted_by_rank_ace_low

    if cards.each_cons(2).all? { |pair| pair[1].rank_ace_low + 1 == pair[0].rank_ace_low }
      base_score(:straight) + fractional_score([cards.last], :rank_ace_low)
    end
  end

  private def flush
    cards = partitioned_by_suit

    if cards.size == 1
      base_score(:flush) + fractional_score([*sorted_by_rank(cards.first)])
    end
  end

  private def full_house
    triples = partitioned_by_rank.select { |p| p.size == 3 }
    pairs = partitioned_by_rank.select { |p| p.size == 2 }

    if pairs.size == 1 && triples.size == 1
      base_score(:full_house) + fractional_score([triples.first.first, pairs.first.first])
    end
  end

  private def four_of_a_kind
    quads = partitioned_by_rank.select { |p| p.size == 4 }

    if quads.size == 1
      everything_else = partitioned_by_rank.select { |p| p.size == 1 }
      base_score(:four_of_a_kind) + fractional_score([quads.first.first, *everything_else.flatten])
    end
  end

  private def straight_flush
    if straight && flush
      base_score(:straight_flush) + fractional_score([sorted_by_rank.last])
    end
  end

  private def straight_flush_ace_low
    if straight_ace_low && flush
      base_score(:straight_flush) + fractional_score([sorted_by_rank_ace_low.last], :rank_ace_low)
    end
  end
end

class Poker::Hand::Card
  getter suit : Char, rank : Int32, rank_ace_low : Int32

  def initialize(s)
    @rank = parse_rank(s)
    @rank_ace_low = parse_rank_ace_low(s)
    @suit = parse_suit(s)
  end

  private def parse_rank(s)
    {
      'J' => 11,
      'Q' => 12,
      'K' => 13,
      'A' => 14,
    }[s[0]]? || s[0...-1].to_i
  end

  private def parse_rank_ace_low(s)
    {
      'J' => 11,
      'Q' => 12,
      'K' => 13,
      'A' => 1,
    }[s[0]]? || s[0...-1].to_i
  end

  private def parse_suit(s)
    s[-1]
  end
end
