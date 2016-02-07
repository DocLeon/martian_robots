class Position
  attr_reader :x_coordinate
  attr_reader :y_coordinate
  def self.from(instructions_sent)
    Position.new(instructions_sent[1][0].split(' '))
  end

  def initialize(co_ords)
    @x_coordinate = co_ords[0]
    @y_coordinate = co_ords[1]
  end

  def to_s
    @x_coordinate + ' ' + @y_coordinate
  end
end

class CommandCentre
  def send(instructions)
    @instructions = instructions
  end

  def output
    movement = @instructions[2][0]
    position = Position.from(@instructions)
    return "#{position} #{position_after_movement(movement)}"
  end

  def movement_from(instuctions)
    instructions[2][0]
  end

  def position_after_movement(movement)
    return "S" if movement == "R"
    return "N" if movement == "L"
    return "W" if movement == "RR"
    "E"
  end
end
