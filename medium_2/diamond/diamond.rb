class Diamond

  def self.make_diamond(letter)
    return nil unless valid_input?(letter)
    letter == 'A' ? top_half(letter) : top_half(letter) + bottom_half(letter)
  end

  def self.valid_input?(input)
    ('A'..'Z').to_a.include?(input)
  end

  def self.top_half(letter)
    string = ''
    count = 0
    limit = letter.ord - 'A'.ord
    outer_spaces = ' ' * limit
    string += outer_spaces + 'A' + outer_spaces + "\n"
    count += 1
    until count > limit
      outer_spaces = ' ' * (limit-count)
      inner_spaces = ' ' * ((2*count)-1)
      current_letter = ('A'.ord+count).chr
      string += outer_spaces + current_letter + inner_spaces +
                + current_letter + outer_spaces + "\n"
      count += 1
    end
    string
  end

  def self.bottom_half(letter)
    string = ''
    limit = (letter.ord - 'A'.ord)
    count = limit - 1
    until count == 0
      outer_spaces = ' ' * (limit-count)
      inner_spaces = ' ' * ((2*count)-1)
      current_letter = ('A'.ord+count).chr
      string += outer_spaces + current_letter + inner_spaces +
                + current_letter + outer_spaces + "\n"
      count -= 1
    end
    outer_spaces = ' ' * limit
    string += outer_spaces + 'A' + outer_spaces + "\n"
    string
  end
end

puts Diamond.make_diamond('C')
