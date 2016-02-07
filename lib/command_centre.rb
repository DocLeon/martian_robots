class Position
  attr_reader :x_coordinate
  attr_reader :y_coordinate
  def self.from(start_position,movements)
    Position.new(start_position, movements)
  end

  def initialize(co_ords, movements)
    @x_coordinate = co_ords[0]
    @y_coordinate = co_ords[1]
    @orientation = move(movements)
  end

  def move(movement)
    return "S" if movement == "R"
    return "N" if movement == "L"
    return "W" if movement == "RR"
    "E"
  end

  def to_s
    "#{@x_coordinate} #{@y_coordinate} #{@orientation}"
  end
end

class CommandCentre
  def send(instructions_sent)
    start_position = instructions_sent[1][0].split(' ')
    movements = instructions_sent[2][0]
    @final_position = Position.from(start_position,movements)
  end

  def output
    "#{@final_position}"
  end

end
