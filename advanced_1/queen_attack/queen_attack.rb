class Queens
  attr_reader :board

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @board = Array.new(8) {"_ _ _ _ _ _ _ _"}
    @board[white[0]][white[1]*2] = 'W'
    @board[black[0]][black[1]*2] = 'B'
  end

  def white
    find_queen('W')
  end

  def black
    find_queen('B')
  end

  def find_queen(color)
    @board.each_with_index do |line, row|
      line.chars.each_with_index do |square, col|
        if square == color
          return [row, col/2]
        end
      end
    end
  end

  def to_s
    @board.join("\n")
  end

  def attack?
    # same row
    white[0] == black[0] ||
    # same col
    white[1] == black[1] ||
    # on a diagonal
    diagonal?
  end

  def diagonal?
    queens = [white, black].sort_by{|xy| xy[0]}
    (8 - queens[0][0]).times do |displacement|
      if [queens[0][0] + displacement, queens[0][1] + displacement] == queens[1] ||
         [queens[0][0] + displacement, queens[0][1] - displacement] == queens[1]
        return true
      end
    end
    false
  end
end
