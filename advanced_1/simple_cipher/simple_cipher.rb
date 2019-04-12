class Cipher

  CIPHER = ('a'..'z').to_a

  def initialize(key=nil)
    key ? @key = key : @key = generate_key
    raise ArgumentError if @key =~ /[^a-z]/  || @key.empty?
  end

  def generate_key
    key = ''
    100.times { key << CIPHER.sample }
    @key = key
  end

  def key
    @key
  end

  def encode(string)
    encoded = ''
    string.chars.each_with_index do |char, index|
      encoded << shift_letter(char, @key[index])
    end
    encoded
  end

  def decode(string)
    decoded = ''
    string.chars.each_with_index do |char, index|
      decoded << unshift_letter(char, @key[index])
    end
    decoded
  end

  def shift_letter(letter, cipher)
    shift_distance = cipher.ord - 'a'.ord
    shifted_ord = letter.ord + shift_distance
    if shifted_ord > 122
      shifted_ord = ((shifted_ord - 96) % 26) + 96
    end
    shifted_ord.chr
  end

  def unshift_letter(letter, cipher)
    shift_distance = cipher.ord - 'a'.ord
    shifted_ord = letter.ord - shift_distance
    if shifted_ord < 97
      shifted_ord += 26
    end
    shifted_ord.chr
  end


end

a = Cipher.new
p a.key
