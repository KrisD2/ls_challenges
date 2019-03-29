class SumOfMultiples

  MULTIPLES = [3, 5]

  def initialize(*multiples)
    multiples = MULTIPLES if multiples.empty?
    @multiples = multiples
  end

  def to(limit)
    nums = (@multiples.min...limit).to_a
    nums.select do |n|
      @multiples.any? { |multiple| n % multiple == 0 }
    end.inject(:+)
  end

  def self.to(limit)
    return 0 if limit < MULTIPLES.min
    nums = (MULTIPLES.min...limit).to_a
    nums.select do |n|
      MULTIPLES.any? { |multiple| n % multiple == 0 }
    end.inject(:+)
  end
end

p SumOfMultiples.new().to(4)
