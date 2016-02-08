require 'robot_position'

class CommandCentre
  def send(instructions_sent)
    robot_instructions_start = 1
    @robot_positions = []
     while robot_instructions_start < instructions_sent.count do
       instructions = instructions_sent[robot_instructions_start,2]
       robot_position = final_robot_position_from instructions
       @robot_positions << robot_position
       robot_instructions_start += 2
     end
  end

  def final_robot_position_from(instructions)
    start_position = instructions[0][0].split(' ')
    movements = instructions[1][0]
    robot_position = RobotPosition.new(start_position)
    robot_position.move(movements)
    robot_position
  end

  def output
    output = []
    @robot_positions.each do |robot_position|
      output << ["#{robot_position}"]
    end
    output
  end

end
