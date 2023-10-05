require "spec"
require "../src/*"

describe Blackjack do
  describe "parse_card" do
    it "parse ace" do
      Blackjack.parse_card("ace").should eq(11)
    end

    it "parse two" do
      Blackjack.parse_card("two").should eq(2)
    end

    it "parse three" do
      Blackjack.parse_card("three").should eq(3)
    end

    it "parse four" do
      Blackjack.parse_card("four").should eq(4)
    end

    it "parse five" do
      Blackjack.parse_card("five").should eq(5)
    end

    it "parse six" do
      Blackjack.parse_card("six").should eq(6)
    end

    it "parse seven" do
      Blackjack.parse_card("seven").should eq(7)
    end

    it "parse eight" do
      Blackjack.parse_card("eight").should eq(8)
    end

    it "parse nine" do
      Blackjack.parse_card("nine").should eq(9)
    end

    it "parse ten" do
      Blackjack.parse_card("ten").should eq(10)
    end

    it "parse jack" do
      Blackjack.parse_card("jack").should eq(10)
    end

    it "parse queen" do
      Blackjack.parse_card("queen").should eq(10)
    end

    it "parse king" do
      Blackjack.parse_card("king").should eq(10)
    end

    it "parse other" do
      Blackjack.parse_card("joker").should eq(0)
    end
  end

  describe "card_range" do
    it "lower low range" do
      Blackjack.card_range("two", "two").should eq("low")
    end

    it "mid low range" do
      Blackjack.card_range("three", "three").should eq("low")
    end

    it "upper low range" do
      Blackjack.card_range("four", "seven").should eq("low")
    end

    it "lower mid range" do
      Blackjack.card_range("seven", "five").should eq("mid")
    end

    it "mid mid range" do
      Blackjack.card_range("seven", "seven").should eq("mid")
    end

    it "upper mid range" do
      Blackjack.card_range("seven", "nine").should eq("mid")
    end

    it "lower high range" do
      Blackjack.card_range("eight", "nine").should eq("high")
    end

    it "mid high range" do
      Blackjack.card_range("eight", "jack").should eq("high")
    end

    it "upper high range" do
      Blackjack.card_range("ten", "king").should eq("high")
    end

    it "blackjack" do
      Blackjack.card_range("ace", "ten").should eq("blackjack")
    end
  end

  describe "first_turn" do
    it "pair of aces" do
      Blackjack.first_turn("ace", "ace", "ace").should eq "P"
    end

    it "pair of jacks" do
      Blackjack.first_turn("jack", "jack", "ace").should eq "S"
    end

    it "pair of queens" do
      Blackjack.first_turn("queen", "queen", "ace").should eq "S"
    end

    it "pair of twos" do
      Blackjack.first_turn("two", "two", "ace").should eq "H"
    end

    it "pair of five" do
      Blackjack.first_turn("five", "five", "ace").should eq "H"
    end

    it "blackjack with ace for dealer" do
      Blackjack.first_turn("ace", "king", "ace").should eq "S"
    end

    it "blackjack with queen for dealer" do
      Blackjack.first_turn("jack", "ace", "queen").should eq "S"
    end

    it "blackjack with five for dealer" do
      Blackjack.first_turn("ten", "ace", "five").should eq "W"
    end

    it "blackjack with nine for dealer" do
      Blackjack.first_turn("ten", "ace", "nine").should eq "W"
    end

    it "score of 20" do
      Blackjack.first_turn("ten", "jack", "ace").should eq "S"
    end

    it "score of 19" do
      Blackjack.first_turn("nine", "king", "ace").should eq "S"
    end

    it "score of 18" do
      Blackjack.first_turn("eight", "queen", "ace").should eq "S"
    end

    it "score of 17" do
      Blackjack.first_turn("seven", "jack", "ace").should eq "S"
    end

    it "score of 16 with six for dealer" do
      Blackjack.first_turn("king", "six", "six").should eq "S"
    end

    it "score of 16 with seven for dealer" do
      Blackjack.first_turn("six", "jack", "seven").should eq "H"
    end

    it "score of 16 with ace for dealer" do
      Blackjack.first_turn("six", "jack", "ace").should eq "H"
    end

    it "score of 15 with six for dealer" do
      Blackjack.first_turn("king", "five", "six").should eq "S"
    end

    it "score of 15 with seven for dealer" do
      Blackjack.first_turn("five", "jack", "seven").should eq "H"
    end

    it "score of 15 with queen for dealer" do
      Blackjack.first_turn("five", "queen", "queen").should eq "H"
    end

    it "score of 14 with six for dealer" do
      Blackjack.first_turn("king", "four", "six").should eq "S"
    end

    it "score of 14 with seven for dealer" do
      Blackjack.first_turn("four", "jack", "seven").should eq "H"
    end

    it "score of 14 with queen for dealer" do
      Blackjack.first_turn("four", "queen", "queen").should eq "H"
    end

    it "score of 13 with six for dealer" do
      Blackjack.first_turn("king", "three", "six").should eq "S"
    end

    it "score of 13 with seven for dealer" do
      Blackjack.first_turn("three", "jack", "seven").should eq "H"
    end

    it "score of 13 with queen for dealer" do
      Blackjack.first_turn("three", "queen", "queen").should eq "H"
    end

    it "score of 12 with six for dealer" do
      Blackjack.first_turn("king", "two", "six").should eq "S"
    end

    it "score of 12 with seven for dealer" do
      Blackjack.first_turn("two", "jack", "seven").should eq "H"
    end

    it "score of 12 with queen for dealer" do
      Blackjack.first_turn("two", "queen", "queen").should eq "H"
    end

    it "score of 11 with king for dealer" do
      Blackjack.first_turn("two", "nine", "king").should eq "H"
    end

    it "score of 10 with two for dealer" do
      Blackjack.first_turn("two", "eight", "two").should eq "H"
    end

    it "score of 5 with queen for dealer" do
      Blackjack.first_turn("two", "three", "queen").should eq "H"
    end

    it "score of 4 with five for dealer" do
      Blackjack.first_turn("two", "two", "five").should eq "H"
    end
  end
end
