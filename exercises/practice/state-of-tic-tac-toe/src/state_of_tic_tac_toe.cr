module TicTacToe
  enum State
    Win
    Draw
    Ongoing
  end

  enum Error
    XWentTwice
    OStarted
    GameShouldHaveEndedAfterTheGameWasWon
  end

  private alias Board = Array(String)

  # Write your code for the 'State of Tic-Tac-Toe' exercise in this file.
  def self.state(board : Board) : State | Error
  end
end
