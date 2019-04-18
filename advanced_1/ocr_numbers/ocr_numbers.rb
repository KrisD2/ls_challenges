CYPHER = {
          [' _', '| |', '|_|'] => '0', ["   ", "  |", "  |"] => '1',
          [" _ ", " _|", "|_ "] => '2', [" _", " _|", "|_"] => '2',
          [" _", " _|", " _|"] => '3', [" _", " _|", " _|"] => '3',
          ["   ", "|_|", "  |"] => '4', [" _ ", "|_ ", " _|"] => '5',
          [" _", "|_", "|_|"] => '6', [" _ ", "  |", "  |"] => '7',
          [" _ ", "|_|", "|_|"] => '8', [" _", "|_|", " _|"] => '9',
          [" _", "| |", "|_|"] => '0'
}


class OCR

  def initialize(text)
    @text = text
  end

  def convert

    binary_font = @text.split("\n\n")
    converted_text = []

    binary_font.each do |binary_font_line|
      converted_text << convert_single_line(binary_font_line)
    end

    converted_text.join(", ")
  end

end

  def convert_single_line(binary_font)
    scanned_input = []

    binary_font.each_line do |line|
      scanned_input << line.scan(/...?/)
    end
    grouped_input = Array.new(scanned_input[0].size) {[]}
    scanned_input.each do |line|
      line.each_with_index do |el, index|
        grouped_input[index] << el
      end
    end
    grouped_input.map{|grid_num| CYPHER.fetch(grid_num, '?')}.join
  end
