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

  def self.state(board : Board) : State | Error
    x_count = count(board, 'X')
    o_count = count(board, 'O')

    return Error::XWentTwice if x_count - o_count > 1
    return Error::OStarted if o_count > x_count

    x_won = win?(board, 'X')
    o_won = win?(board, 'O')

    if x_won && o_won
      Error::GameShouldHaveEndedAfterTheGameWasWon
    elsif x_won || o_won
      State::Win
    else
      ongoing?(board) ? State::Ongoing : State::Draw
    end
  end

  private def self.count(board : Board, player : Char) : Int32
    board.map do |row|
      row.count { |element| element == player }
    end.sum
  end

  private def self.ongoing?(board : Board) : Bool
    board.any? { |row| row.includes?(" ") }
  end

  private def self.win?(board : Board, player : Char) : Bool
    row_win?(board, player) || column_win?(board, player) || diagonal_win?(board, player)
  end

  private def self.row_win?(board : Board, player : Char) : Bool
    board.any? { |row| row == player.to_s * 3 }
  end

  private def self.column_win?(board : Board, player : Char) : Bool
    (0..2).any? do |column|
      board[0][column] == player && board[1][column] == player && board[2][column] == player
    end
  end

  private def self.diagonal_win?(board : Board, player : Char) : Bool
    (board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
      (board[0][2] == player && board[1][1] == player && board[2][0] == player)
  end
end
