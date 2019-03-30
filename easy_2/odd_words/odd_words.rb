def odd_words(string)
  string = string.split(" ").map.with_index do |word, index|
    word = word[0..-2] if word[-1] == '.'
    if index.odd?
      word.reverse
    else
      word
    end
  end

  string.join(' ').strip + '.'
end

p odd_words('whats the matter with kansas.')
p odd_words('whats the matter kansas.')
p odd_words('whats   the  matter with  kansas  .')
