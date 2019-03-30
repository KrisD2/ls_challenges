class OutOfRange < StandardError
end

class Integer

  def to_roman
    raise OutOfRange, 'Number must no larger than 3000.' if self > 3000
    int = self
    roman = ''

    until int / 1000 == 0
      int -= 1000
      roman << 'M'
    end

    until int / 900 == 0
      int -= 900
      roman << 'CM'
    end

    until int / 500 == 0
      int -= 500
      roman << 'D'
    end

    until int / 400 == 0
      int -= 400
      roman << 'CD'
    end

    until int / 100 == 0
      int -= 100
      roman << 'C'
    end

    until int / 90 == 0
      int -= 90
      roman << 'XC'
    end

    until int / 50 == 0
      int -= 50
      roman << 'L'
    end

    until int / 40 == 0
      int -= 40
      roman << 'XL'
    end

    until int / 10 == 0
      int -= 10
      roman << 'X'
    end

    until int / 9 == 0
      int -= 9
      roman << 'IX'
    end

    until int / 5 == 0
      int -= 5
      roman << 'V'
    end

    until int / 4 == 0
      int -= 4
      roman << 'IV'
    end

    until int / 1 == 0
      int -= 1
      roman << 'I'
    end
    roman
  end
end


p 4000.to_roman
