require "spec"
require "../src/*"

describe Poker do
  it "single hand always wins" do
    hands = [
      "4S 5S 7H 8D JC",
    ]
    expected = [
      "4S 5S 7H 8D JC",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "highest card out of all hands wins" do
    hands = [
      "4D 5S 6S 8D 3C",
      "2S 4C 7S 9H 10H",
      "3S 4S 5D 6H JH",
    ]
    expected = [
      "3S 4S 5D 6H JH",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "a tie has multiple winners" do
    hands = [
      "4D 5S 6S 8D 3C",
      "2S 4C 7S 9H 10H",
      "3S 4S 5D 6H JH",
      "3H 4H 5C 6C JD",
    ]
    expected = [
      "3S 4S 5D 6H JH",
      "3H 4H 5C 6C JD",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "multiple hands with the same high cards, tie compares next highest ranked, down to last card" do
    hands = [
      "3S 5H 6S 8D 7H",
      "2S 5D 6D 8C 7S",
    ]
    expected = [
      "3S 5H 6S 8D 7H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "winning high card hand also has the lowest card" do
    hands = [
      "2S 5H 6S 8D 7H",
      "3S 4D 6D 8C 7S",
    ]
    expected = [
      "2S 5H 6S 8D 7H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "one pair beats high card" do
    hands = [
      "4S 5H 6C 8D KH",
      "2S 4H 6S 4D JH",
    ]
    expected = [
      "2S 4H 6S 4D JH",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "highest pair wins" do
    hands = [
      "4S 2H 6S 2D JH",
      "2S 4H 6C 4D JD",
    ]
    expected = [
      "2S 4H 6C 4D JD",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have the same pair, high card wins" do
    hands = [
      "4H 4S AH JC 3D",
      "4C 4D AS 5D 6C",
    ]
    expected = [
      "4H 4S AH JC 3D",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "two pairs beats one pair" do
    hands = [
      "2S 8H 6S 8D JH",
      "4S 5H 4C 8C 5C",
    ]
    expected = [
      "4S 5H 4C 8C 5C",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have two pairs, highest ranked pair wins" do
    hands = [
      "2S 8H 2D 8D 3H",
      "4S 5H 4C 8S 5D",
    ]
    expected = [
      "2S 8H 2D 8D 3H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have two pairs, with the same highest ranked pair, tie goes to low pair" do
    hands = [
      "2S QS 2C QD JH",
      "JD QH JS 8D QC",
    ]
    expected = [
      "JD QH JS 8D QC",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have two identically ranked pairs, tie goes to remaining card (kicker)" do
    hands = [
      "JD QH JS 8D QC",
      "JS QS JC 2D QD",
    ]
    expected = [
      "JD QH JS 8D QC",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have two pairs that add to the same value, win goes to highest pair" do
    hands = [
      "6S 6H 3S 3H AS",
      "7H 7S 2H 2S AC",
    ]
    expected = [
      "7H 7S 2H 2S AC",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "two pairs first ranked by largest pair" do
    hands = [
      "5C 2S 5S 4H 4C",
      "6S 2S 6H 7C 2C",
    ]
    expected = [
      "6S 2S 6H 7C 2C",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "three of a kind beats two pair" do
    hands = [
      "2S 8H 2H 8D JH",
      "4S 5H 4C 8S 4H",
    ]
    expected = [
      "4S 5H 4C 8S 4H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have three of a kind, tie goes to highest ranked triplet" do
    hands = [
      "2S 2H 2C 8D JH",
      "4S AH AS 8C AD",
    ]
    expected = [
      "4S AH AS 8C AD",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "with multiple decks, two players can have same three of a kind, ties go to highest remaining cards" do
    hands = [
      "5S AH AS 7C AD",
      "4S AH AS 8C AD",
    ]
    expected = [
      "4S AH AS 8C AD",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "a straight beats three of a kind" do
    hands = [
      "4S 5H 4C 8D 4H",
      "3S 4D 2S 6D 5C",
    ]
    expected = [
      "3S 4D 2S 6D 5C",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "aces can end a straight (10 J Q K A)" do
    hands = [
      "4S 5H 4C 8D 4H",
      "10D JH QS KD AC",
    ]
    expected = [
      "10D JH QS KD AC",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "aces can start a straight (A 2 3 4 5)" do
    hands = [
      "4S 5H 4C 8D 4H",
      "4D AH 3S 2D 5C",
    ]
    expected = [
      "4D AH 3S 2D 5C",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "aces cannot be in the middle of a straight (Q K A 2 3)" do
    hands = [
      "2C 3D 7H 5H 2S",
      "QS KH AC 2D 3S",
    ]
    expected = [
      "2C 3D 7H 5H 2S",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands with a straight, tie goes to highest ranked card" do
    hands = [
      "4S 6C 7S 8D 5H",
      "5S 7H 8S 9D 6H",
    ]
    expected = [
      "5S 7H 8S 9D 6H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "even though an ace is usually high, a 5-high straight is the lowest-scoring straight" do
    hands = [
      "2H 3C 4D 5D 6H",
      "4S AH 3S 2D 5H",
    ]
    expected = [
      "2H 3C 4D 5D 6H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "flush beats a straight" do
    hands = [
      "4C 6H 7D 8D 5H",
      "2S 4S 5S 6S 7S",
    ]
    expected = [
      "2S 4S 5S 6S 7S",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have a flush, tie goes to high card, down to the last one if necessary" do
    hands = [
      "2H 7H 8H 9H 6H",
      "3S 5S 6S 7S 8S",
    ]
    expected = [
      "2H 7H 8H 9H 6H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "full house beats a flush" do
    hands = [
      "3H 6H 7H 8H 5H",
      "4S 5H 4C 5D 4H",
    ]
    expected = [
      "4S 5H 4C 5D 4H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have a full house, tie goes to highest-ranked triplet" do
    hands = [
      "4H 4S 4D 9S 9D",
      "5H 5S 5D 8S 8D",
    ]
    expected = [
      "5H 5S 5D 8S 8D",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "with multiple decks, both hands have a full house with the same triplet, tie goes to the pair" do
    hands = [
      "5H 5S 5D 9S 9D",
      "5H 5S 5D 8S 8D",
    ]
    expected = [
      "5H 5S 5D 9S 9D",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "four of a kind beats a full house" do
    hands = [
      "4S 5H 4D 5D 4H",
      "3S 3H 2S 3D 3C",
    ]
    expected = [
      "3S 3H 2S 3D 3C",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have four of a kind, tie goes to high quad" do
    hands = [
      "2S 2H 2C 8D 2D",
      "4S 5H 5S 5D 5C",
    ]
    expected = [
      "4S 5H 5S 5D 5C",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "with multiple decks, both hands with identical four of a kind, tie determined by kicker" do
    hands = [
      "3S 3H 2S 3D 3C",
      "3S 3H 4S 3D 3C",
    ]
    expected = [
      "3S 3H 4S 3D 3C",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "straight flush beats four of a kind" do
    hands = [
      "4S 5H 5S 5D 5C",
      "7S 8S 9S 6S 10S",
    ]
    expected = [
      "7S 8S 9S 6S 10S",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "aces can end a straight flush (10 J Q K A)" do
    hands = [
      "KC AH AS AD AC",
      "10C JC QC KC AC",
    ]
    expected = [
      "10C JC QC KC AC",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "aces can start a straight flush (A 2 3 4 5)" do
    hands = [
      "KS AH AS AD AC",
      "4H AH 3H 2H 5H",
    ]
    expected = [
      "4H AH 3H 2H 5H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "aces cannot be in the middle of a straight flush (Q K A 2 3)" do
    hands = [
      "2C AC QC 10C KC",
      "QH KH AH 2H 3H",
    ]
    expected = [
      "2C AC QC 10C KC",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "both hands have a straight flush, tie goes to highest-ranked card" do
    hands = [
      "4H 6H 7H 8H 5H",
      "5S 7S 8S 9S 6S",
    ]
    expected = [
      "5S 7S 8S 9S 6S",
    ]
    Poker.best_hands(hands).should eq(expected)
  end

  pending "even though an ace is usually high, a 5-high straight flush is the lowest-scoring straight flush" do
    hands = [
      "2H 3H 4H 5H 6H",
      "4D AD 3D 2D 5D",
    ]
    expected = [
      "2H 3H 4H 5H 6H",
    ]
    Poker.best_hands(hands).should eq(expected)
  end
end
