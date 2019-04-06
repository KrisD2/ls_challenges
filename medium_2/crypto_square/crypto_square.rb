class Crypto

  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.gsub(/\W/, "").downcase
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    plaintext = []
    index = 0
    until index >= normalize_plaintext.size
      plaintext << normalize_plaintext.slice(index, size)
      index += size
    end
    plaintext
  end

  def normalize_ciphertext
    cipher = Array.new(plaintext_segments[0].size) { "" }
    plaintext_segments.each do |word|
      word.chars.each_index do |index|
        cipher[index] << word[index] unless (word[index]) == nil
      end
    end
    cipher.join(' ')
  end

  def ciphertext
    normalize_ciphertext.gsub(/\s/, '')
  end
end
