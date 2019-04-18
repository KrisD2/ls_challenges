class Clock
  attr_reader :hour, :minute

  def self.at(hour, minute=0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = (hour + (minute / 60)) % 24
    @minute = minute % 60
  end

  def to_s
    "%02d:%02d" %[@hour, @minute]
  end

  def +(minutes)
    @hour = (@hour + (minutes / 60)) % 24
    @minute += minutes % 60
    self
  end

  def -(minutes)
    @hour -= 1 if (1..59).cover?(minutes % 60)
    @hour -= minutes / 60
    @hour += 24 until hour > -1
    @minute -= 60 - (minutes % 60)
    @minute = @minute.abs
    self
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end
end
