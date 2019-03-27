class Sieve
attr_reader :limit, :range

  def initialize(limit)
    @limit = limit
    @range = (2..limit).to_a
  end

  def primes
    range.each_with_index do |num, index|
      next if num == nil
      (index + 1).upto(range.size - 1) do |subindex|
        next if range[subindex] == nil
        range[subindex] = nil if range[subindex] % num == 0
      end
    end
    range.select { |n| n != nil}
  end
end
