class SecretHandshake

  EVENTS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(decimal)
    @decimal = decimal
  end

  def commands
    return [] if @decimal.to_i.to_s != @decimal.to_s
    sequence = []
    binary = @decimal.to_i.to_s(2).chars
    SecretHandshake::EVENTS.each_with_index do |action, index|
      sequence << action if binary[-(index+1)] == '1'
    end
    sequence.reverse! if binary.join.to_i/10000 == 1
    sequence
  end
end
