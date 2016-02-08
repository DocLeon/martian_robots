require 'robot_position'

class CommandCentre
  def send(instructions_sent)
    start_position = instructions_sent[1][0].split(' ')
    movements = instructions_sent[2][0]
    @robot_position = RobotPosition.new(start_position)
    @robot_position.move(movements)
  end

  def output
    [["#{@robot_position}"]]
  end

end
