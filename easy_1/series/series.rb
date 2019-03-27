class Series

  def initialize(number)
    @digits = number.split('').map(&:to_i)
  end

  def slices(digit_series)
    raise ArgumentError if digit_series > @digits.size
    result = []
    @digits.each_cons(digit_series) do |series|
      result << series
    end
    result
  end
end
