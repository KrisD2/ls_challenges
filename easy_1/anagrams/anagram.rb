class Anagram

  def initialize(word)
    @word = word.downcase
  end

  def match(list)
    list.select { |candidate| anagram? candidate}
  end

  def anagram?(candidate)
    candidate.size == @word.size &&
    candidate.downcase != @word &&
    candidate.chars.all? do |letter|
      candidate.count(letter.downcase) == @word.count(letter)
    end
  end
end
