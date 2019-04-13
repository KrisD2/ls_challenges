class Robot
  DIRECTIONS = [:north, :east, :south, :west]
  MOVEMENT = [[0, 1], [1, 0], [0, -1], [-1, 0]]

  attr_reader :coordinates

  def initialize
    @direction = :north
    @coordinates = [0, 0]
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include? direction
    @direction = direction
  end

  def bearing
    @direction
  end

  def turn_right
    index = DIRECTIONS.index(@direction) + 1
    @direction = DIRECTIONS[index] || :north
  end

  def turn_left
    index = DIRECTIONS.index(@direction) - 1
    @direction = DIRECTIONS[index]
  end

  def at(coord1, coord2)
    @coordinates = [coord1, coord2]
  end

  def advance
    @coordinates = [@coordinates, MOVEMENT[DIRECTIONS.index(@direction)]].
    transpose.map(&:sum)
  end
end

class Simulator
  COMMANDS = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}

  def instructions(instructions)
    commands = []
    instructions.chars.each do |instruction|
      commands << COMMANDS[instruction]
    end
    commands
  end

  def place(robot, x: 0, y: 0, direction: north)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, commands)
    instructions = self.instructions(commands)
    instructions.each do |command|
      robot.send(command)
    end
  end

end
