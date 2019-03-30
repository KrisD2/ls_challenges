class PerfectNumber

  def self.classify(num)
    raise RuntimeError if num < 1
    sum_of_factors = sum_of_factors(num)
    case
    when sum_of_factors == num
      "perfect"
    when sum_of_factors > num
      "abundant"
    when sum_of_factors < num
      "deficient"
    end
  end

  def self.sum_of_factors(num)
    (1...num).to_a.select { |n| num%n==0}.inject(:+)
  end
end
