class Luhn

  def initialize(number)
    @number = number
  end

  def addends
    digits = @number.to_s.chars.map(&:to_i)
    digits.each_index do |index|
      if index.odd?
        if digits[-(index+1)] < 5
          digits[-(index+1)] *= 2
        else
          digits[-(index+1)] = (digits[-(index+1)] * 2) - 9
        end
      end
    end
    digits
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    num = (num.to_s << '0').to_i
    return num if Luhn.new(num).valid?
    remainder = 10 - (Luhn.new(num).checksum % 10)
    num + remainder
  end
end
