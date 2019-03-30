class Scrabble

  LETTER_VALUES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.class != String
    score = 0
    @word.upcase.chars.each do |letter|
      Scrabble::LETTER_VALUES.each do |letter_group, value|
        if letter_group.include? letter
          score += value
          break
        end
      end
    end
    score
  end

  def self.score(word)
    new(word).score
  end
end
