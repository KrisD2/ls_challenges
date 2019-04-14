class Game

  def initialize
    @frame = 0
    @throw = 0
    @score = 0
    @frames = Array.new(10) {[]}
  end

  def roll(pins)
    validate_input(pins)
    if @frame == 9
      @frames[@frame] << pins
      if @frames[9].size == 2 && @frames[9].inject(:+) != 10 &&
         @frames[9].none? { |score| score == 10}
        @frame += 1
      elsif @frames[9].size == 3
        @frame += 1
      end
    elsif pins == 10
      @frames[@frame] = 10
      @throw += 2
      @frame += 1
    else
      @frames[@frame][@throw % 2] = pins
      @frame += 1 if @throw % 2 == 1
      @throw += 1
    end
  end

  def score
    validate_score_can_be_taken
    @frames.each_with_index do |frame, frame_num|
      if frame_num == 9
        @score += frame.inject(:+)
      elsif frame.instance_of? Array
        if frame.inject(:+) == 10
          @score += 10 + next_throw_score(frame_num)
        else
          @score += frame.inject(:+)
        end
      elsif frame == 10
        if frame_num == 8 && next_throw_score(frame_num) == 10
          @score += 10 + 10 + @frames[9][1]
        elsif next_throw_score(frame_num) == 10
          @score += 10 + 10 + next_throw_score(frame_num + 1)
        else
          @score += 10 + @frames[frame_num + 1].inject(:+)
        end
      end
    end
    @score
  end

  def next_throw_score(current_frame_num)
    if @frames[current_frame_num + 1].instance_of? Array
      @frames[current_frame_num + 1][0]
    else
      @frames[current_frame_num + 1]
    end
  end

  def validate_input(pins)
    case
    when !((0..10).include?(pins))
      raise RuntimeError, "Pins must have a value from 0 to 10"
    when @frame < 9 && @frames[@frame].size == 1 && (@frames[@frame][0] + pins) > 10
      raise RuntimeError, "Pin count exceeds pins on the lane"
    when @frame == 9 && @frames[9].size == 2 && (@frames[9][1] + pins) > 10 &&
         @frames[9][1] != 10
      raise RuntimeError, "Pin count exceeds pins on the lane"
    when @frame > 9
      raise RuntimeError, "Should not be able to roll after game is over"
    end
  end

  def validate_score_can_be_taken
    case
    when @frame < 10
      raise RuntimeError, "Score cannot be taken until the end of the game"
    end
  end
end
