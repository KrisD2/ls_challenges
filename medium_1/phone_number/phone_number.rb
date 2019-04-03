class PhoneNumber

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    return '0000000000' if invalid_number?
    clean_number = @phone_number.gsub(/\D/, '')
    clean_number.slice(-10..-1)
  end

  def invalid_number?
    !(@phone_number.gsub(/\W/, '') =~ /^1?[\d]{10}$/)
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{area_code}) #{number[3..5]}-#{number[6..9]}"
  end
end
