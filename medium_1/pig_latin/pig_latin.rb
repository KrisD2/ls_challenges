class PigLatin

  VOWEL_SOUNDING_LETTERS = /[aefhilmosux]/
  THREE_LETTER_CONSTANT_CLUSTER = /^[^aeiouy]([^aeiouy][^aeiouy]|qu)/
  TWO_LETTER_CONSTANT_CLUSTER = /^([^aeiouyx][^aeiouy]|qu)/
  CONSTANT = /^([^aeiouyx]|ye|xe)/

  def self.translate(phrase)
    phrase.split.map{|word| translate_word(word)}.join(' ')
  end

  def self.translate_word(word)
    if word =~ THREE_LETTER_CONSTANT_CLUSTER
      word[3..-1] + word[0..2] + 'ay'
    elsif word =~ TWO_LETTER_CONSTANT_CLUSTER
      word[2..-1] + word[0..1] + 'ay'
    elsif word =~ CONSTANT
      word[1..-1] + word[0] + 'ay'
    elsif word =~ VOWEL_SOUNDING_LETTERS
      word + 'ay'
    end
  end
end
