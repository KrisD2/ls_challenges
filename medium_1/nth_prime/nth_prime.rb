class Prime

  def self.nth(nth_prime)
    raise ArgumentError if nth_prime < 1
    count = 2
    primes = [2]
    until primes.size == nth_prime
      last_prime = primes[-1]
      count += 1
      2.upto(count-1) do |i|
        break if count % i == 0
        primes << count if i == count-1
      end
    end
    primes.last
  end
end
