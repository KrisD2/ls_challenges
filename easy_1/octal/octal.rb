class Octal

  def initialize(num)
    @num = num
    @places = num.reverse.chars
  end

  def to_decimal
    return 0 if invalid_input
    decimal = 0
    @places.each_with_index do |el, index|
      decimal += el.to_i * 8**index
    end
    decimal
  end

  def invalid_input
    !(@num.include? @num.to_i.to_s) ||
    @places[0].include?('8') ||
    @places[0].include?('9')
  end
end
