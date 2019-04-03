class Meetup
  require 'date'

  TEENTH = [13, 14, 15, 16, 17, 18, 19]
  DAY = {monday: 1, tuesday: 2, wednesday: 3, thursday: 4,
         friday: 5, saturday: 6, sunday: 7}

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, schedule)
    day_of_the_week = DAY[day]
    day_of_the_month = nil
    (1..7).to_a.each do |num_day|
      if Date.new(@year, @month, num_day).cwday == day_of_the_week
        day_of_the_month = num_day
      end
    end
    case schedule
    when :first
      Date.new(@year, @month, day_of_the_month)
    when :second
      Date.new(@year, @month, day_of_the_month + 7)
    when :third
      Date.new(@year, @month, day_of_the_month + 14)
    when :fourth
      Date.new(@year, @month, day_of_the_month + 21)
    when :last
      begin
        Date.new(@year, @month, day_of_the_month + 28)
      rescue
        Date.new(@year, @month, day_of_the_month + 21)
      end
    when :teenth
      until TEENTH.include? day_of_the_month
        day_of_the_month += 7
      end
      Date.new(@year, @month, day_of_the_month)
    end
  end
end
