require "spec"
require "../src/*"

describe "StateOfTicTacToe" do
  describe "Won games" do
    it "Finished game where X won via left column victory" do
      board = [
        "XOO",
        "X  ",
        "X  ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via middle column victory" do
      board = [
        "OXO",
        " X ",
        " X ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via right column victory" do
      board = [
        "OOX",
        "  X",
        "  X",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via left column victory" do
      board = [
        "OXX",
        "OX ",
        "O  ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via middle column victory" do
      board = [
        "XOX",
        " OX",
        " O ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via right column victory" do
      board = [
        "XXO",
        " XO",
        "  O",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via top row victory" do
      board = [
        "XXX",
        "XOO",
        "O  ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via middle row victory" do
      board = [
        "O  ",
        "XXX",
        " O ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via bottom row victory" do
      board = [
        " OO",
        "O X",
        "XXX",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via top row victory" do
      board = [
        "OOO",
        "XXO",
        "XX ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via middle row victory" do
      board = [
        "XX ",
        "OOO",
        "X  ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via bottom row victory" do
      board = [
        "XOX",
        " XX",
        "OOO",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via falling diagonal victory" do
      board = [
        "XOO",
        " X ",
        "  X",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via rising diagonal victory" do
      board = [
        "O X",
        "OX ",
        "X  ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via falling diagonal victory" do
      board = [
        "OXX",
        "OOX",
        "X O",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where O won via rising diagonal victory" do
      board = [
        "  O",
        " OX",
        "OXX",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via a row and a column victory" do
      board = [
        "XXX",
        "XOO",
        "XOO",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end

    pending "Finished game where X won via two diagonal victories" do
      board = [
        "XOX",
        "OXO",
        "XOX",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Win)
    end
  end

  describe "Drawn games" do
    pending "Draw" do
      board = [
        "XOX",
        "XXO",
        "OXO",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Draw)
    end

    pending "Another draw" do
      board = [
        "XXO",
        "OXX",
        "XOO",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Draw)
    end
  end

  describe "Ongoing games" do
    pending "Ongoing game: one move in" do
      board = [
        "   ",
        "X  ",
        "   ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Ongoing)
    end

    pending "Ongoing game: two moves in" do
      board = [
        "O  ",
        " X ",
        "   ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Ongoing)
    end

    pending "Ongoing game: five moves in" do
      board = [
        "X  ",
        " XO",
        "OX ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::State::Ongoing)
    end
  end

  describe "Invalid boards" do
    pending "Invalid board: X went twice" do
      board = [
        "XX ",
        "   ",
        "   ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::Error::XWentTwice)
    end

    pending "Invalid board: O started" do
      board = [
        "OOX",
        "   ",
        "   ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::Error::OStarted)
    end

    pending "Invalid board: X won and O kept playing" do
      board = [
        "XXX",
        "OOO",
        "   ",
      ]
      TicTacToe.state(board).should eq(TicTacToe::Error::GameShouldHaveEndedAfterTheGameWasWon)
    end

    pending "Invalid board: players kept playing after a win" do
      board = [
        "XXX",
        "OOO",
        "XOX",
      ]
      TicTacToe.state(board).should eq(TicTacToe::Error::GameShouldHaveEndedAfterTheGameWasWon)
    end
  end
end
