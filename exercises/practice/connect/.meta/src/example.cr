module Connect
  def self.winner(board : Array(String)) : String
    return Board.new(board).winner
  end

  private class Board
    @board : Array(Array(Char))

    def initialize(board)
      @board = board.map { |row| row.gsub(" ", "").chars }
      mark
    end

    def winner
      return "X" if x_at_right?
      return "O" if o_at_bottom?
      ""
    end

    private def x_at_right?
      (0..max_y).any? { |y| at(max_x, y) == 'x' }
    end

    private def o_at_bottom?
      (0..max_x).any? { |x| at(x, max_y) == 'o' }
    end

    private def mark
      mark_xs_at_left
      while iterate 'X'; end

      mark_os_at_top
      while iterate 'O'; end
    end

    private def mark_xs_at_left
      (0..max_y).each do |y|
        put(0, y, 'x') if at(0, y) == 'X'
      end
    end

    private def mark_os_at_top
      (0..max_x).each do |x|
        put(x, 0, 'o') if at(x, 0) == 'O'
      end
    end

    private def iterate(player)
      marked = false

      each_position do |x, y|
        next unless at(x, y) == player

        each_neighbor x, y do |nx, ny|
          if at(nx, ny) == player.downcase
            put(x, y, player.downcase)
            marked = true
          end
        end
      end

      marked
    end

    private def each_position(&block : (Int32, Int32) ->)
      (0..max_x).each do |x|
        (0..max_y).each do |y|
          block.call(x, y)
        end
      end
    end

    private def each_neighbor(x, y, &block : (Int32, Int32) ->)
      [[1, 0], [-1, 0], [0, 1], [0, -1], [-1, 1], [1, -1]].each do |(dx, dy)|
        xx = x + dx
        yy = y + dy
        block.call(xx, yy) if on_board?(xx, yy)
      end
    end

    private def at(x, y)
      @board[y][x]
    end

    private def put(x, y, v)
      @board[y][x] = v
    end

    private def on_board?(x, y)
      (0..max_x).includes?(x) && (0..max_y).includes?(y)
    end

    private def max_x
      @board.first.size - 1
    end

    private def max_y
      @board.size - 1
    end
  end
end
