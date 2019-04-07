class RunLengthEncoding

  def self.encode(input)
    current_char = input[0]
    count = 0
    coded = ""
    input.chars.each do |char|
      if current_char == char
        count += 1
      else
        coded << ((count > 1) ? "#{count}#{current_char}" : "#{current_char}")
        count = 1
        current_char = char
      end
    end
    coded << ((count > 1) ? "#{count}#{current_char}" : "#{current_char}")
    coded
  end

  def self.decode(input)
    decoded = ""
    input.scan(/\d*[^0-9]/).each do |code|
      decoded << ((code.size > 1) ? code[-1] * code[0..-2].to_i : code[0])
    end
    decoded
  end
end
