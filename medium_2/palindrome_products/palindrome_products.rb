class Palindromes
  attr_reader :palindromes

  def initialize(max_factor:, min_factor:0)
    @max_factor = max_factor
    @min_factor = min_factor || 0
    @palindromes = {}
  end

  def generate
    @min_factor.upto(@max_factor) do |i|
      @min_factor.upto(@max_factor) do |j|
        if (i*j).to_s == (i*j).to_s.reverse
          if @palindromes.key? (i*j)
            next if @palindromes[(i*j)].any? {|arr| arr == [j, i]}
            @palindromes[(i*j)] << [i, j]
          else
            @palindromes[(i*j)] = [[i, j]]
          end
        end
      end
    end
  end

  def largest
    max = @palindromes.keys.max
    {max => @palindromes[max]}
  end

  def smallest
    min = @palindromes.keys.min
    {min => @palindromes[min]}
  end
end

class Hash
  def value
    self.keys[0]
  end

  def factors
    self.values[0]
  end
end
