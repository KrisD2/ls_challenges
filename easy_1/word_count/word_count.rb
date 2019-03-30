class Phrase

  def initialize(phrase)
    @phrase = phrase.gsub(/(\W+\s)|(\W+$)|(\s\W+)|([\.,])/, ' ').downcase
  end

  def word_count
    count = {}
    @phrase.split.each do |word|
      count[word] ? count[word] += 1 : count[word] = 1
    end
    count
  end
end
