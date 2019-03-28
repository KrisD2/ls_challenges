class Trinary

  def initialize(num)
    @num = num
    @places = num.reverse.chars
  end

  def to_decimal
    return 0 if invalid_input
    decimal = 0
    @places.each_with_index do |el, index|
      decimal += el.to_i * 3**index
    end
    decimal
  end

  def invalid_input
    !!(@num =~ /[3-9]*[a-zA-Z]/)
  end
end
