class RailFenceCipher

  def self.encode(string, rails)
    return string if rails == 1 || string.size < rails
    message = string.gsub(' ', '')
    @encoded = Array.new(rails) { (['.'] * message.size).join(' ') }
    row = 0
    col = 0
    counting_down = false
    message.chars.each do |char|
      @encoded[row][col] = char
      counting_down = false if row == 0
      counting_down = true if row == (rails - 1)
      counting_down ? row -= 1 : row += 1
      col += 2
    end
    @encoded.map!{ |row| row.gsub(/[\W]/, '') }.join
  end

  def self.decode(string, rails)
    return string if rails == 1
    @encoded = Array.new(rails) { (['.'] * string.size).join(' ') }
    row = 0
    col = 0
    counting_down = false
    string.chars.each do |char|
      @encoded[row][col] = char
      counting_down = false if row == 0
      counting_down = true if row == (rails - 1)
      counting_down ? row -= 1 : row += 1
      col += 2
    end

    @encoded = @encoded.map{ |row| row.gsub(/[\W]/, '') }
    decoded = []
    message = string.dup
    @encoded.each do |rail|
      decoded << message.slice!(0, rail.size)
    end
    @decoded = ''
    row = 0
    counting_down = false
    (string.size).times do
      @decoded << decoded[row].slice!(0)
      counting_down = false if row == 0
      counting_down = true if row == (rails - 1)
      counting_down ? row -= 1 : row += 1
    end
    @decoded
  end
end
