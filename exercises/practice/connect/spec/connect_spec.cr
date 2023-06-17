require "spec"
require "../src/*"

describe "Connect" do
  it "an empty board has no winner" do
    board = [
      ". . . . .",
      " . . . . .",
      "  . . . . .",
      "   . . . . .",
      "    . . . . .",
    ]
    Connect.winner(board).should eq ""
  end

  pending "X can win on a 1x1 board" do
    board = [
      "X",
    ]
    Connect.winner(board).should eq "X"
  end

  pending "O can win on a 1x1 board" do
    board = [
      "O",
    ]
    Connect.winner(board).should eq "O"
  end

  pending "only edges does not make a winner" do
    board = [
      "O O O X",
      " X . . X",
      "  X . . X",
      "   X O O O",
    ]
    Connect.winner(board).should eq ""
  end

  pending "illegal diagonal does not make a winner" do
    board = [
      "X O . .",
      " O X X X",
      "  O X O .",
      "   . O X .",
      "    X X O O",
    ]
    Connect.winner(board).should eq ""
  end

  pending "nobody wins crossing adjacent angles" do
    board = [
      "X . . .",
      " . X O .",
      "  O . X O",
      "   . O . X",
      "    . . O .",
    ]
    Connect.winner(board).should eq ""
  end

  pending "X wins crossing from left to right" do
    board = [
      ". O . .",
      " O X X X",
      "  O X O .",
      "   X X O X",
      "    . O X .",
    ]
    Connect.winner(board).should eq "X"
  end

  pending "O wins crossing from top to bottom" do
    board = [
      ". O . .",
      " O X X X",
      "  O O O .",
      "   X X O X",
      "    . O X .",
    ]
    Connect.winner(board).should eq "O"
  end

  pending "X wins using a convoluted path" do
    board = [
      ". X X . .",
      " X . X . X",
      "  . X . X .",
      "   . X X . .",
      "    O O O O O",
    ]
    Connect.winner(board).should eq "X"
  end

  pending "X wins using a spiral path" do
    board = [
      "O X X X X X X X X",
      " O X O O O O O O O",
      "  O X O X X X X X O",
      "   O X O X O O O X O",
      "    O X O X X X O X O",
      "     O X O O O X O X O",
      "      O X X X X X O X O",
      "       O O O O O O O X O",
      "        X X X X X X X X O",
    ]
    Connect.winner(board).should eq "X"
  end
end
