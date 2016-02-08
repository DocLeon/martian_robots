require 'robot_position'

class CommandCentre
  def send(instructions_sent)
    start_position = instructions_sent[1][0].split(' ')
    movements = instructions_sent[2][0]
    @robot_final_position = RobotPosition.new(start_position,movements)
  end

  def output
    "#{@robot_final_position}"
  end

end
