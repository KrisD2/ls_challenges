class Robot

  @@robot_names = []

  def initialize
    @name = nil
  end

  def name
    return @name if @name
    @name = generate_name
    until !(@@robot_names.include? @name)
      @name = generate_name
    end
    @@robot_names << @name
    @name
  end

  def generate_name
    generated_name = ""
    2.times { generated_name << ('A'..'Z').to_a.sample }
    3.times { generated_name << ('0'..'9').to_a.sample }
    generated_name
  end

  def reset
    @@robot_names.delete(@name)
    @name = nil
  end
end
