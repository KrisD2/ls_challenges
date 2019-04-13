class ValueError < StandardError
end

class Board

  HINT_SQUARE = /[\s]/
  INVALID_CHAR = /[^\*\s\|\+-]/

  def self.transform(board_input)
    validate_board(board_input)
    board_output = board_input.map{|line| line.dup}
    board_output.each_with_index do |line, line_num|
      line.chars.each_with_index do |char, index|
        raise ValueError if char =~ INVALID_CHAR
        if char =~ HINT_SQUARE
          mines = 0
          # check row above if not the first row
          if line_num > 0
            mines += board_output[line_num-1].slice(index-1, 3).count('*')
          end
          # check current row
          mines += board_output[line_num].slice(index-1, 3).count('*')
          # check row below if not last row-
          if line_num != (board_input.size - 1)
            mines += board_output[line_num+1].slice(index-1, 3).count('*')
          end
          board_output[line_num][index] = (mines == 0) ? " " : "#{mines}"
        end
      end
    end
    board_output
  end

  def self.validate_board(input)
    test_length(input)
    test_border(input)
  end

  def self.test_length(input)
    raise ValueError if input.any?{ |line| line.size != input[0].size}
  end

  def self.test_border(input)
    raise ValueError if !(input[0] =~ /\+-+\+/) ||
                        !(input[1..-2].all?{|line| line =~ /\|.+\|/}) ||
                        !(input[-1] =~ /\+-+\+/)
  end
end
