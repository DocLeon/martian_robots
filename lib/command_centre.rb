require 'robot_position'

class CommandCentre
  def send(instructions_sent)
    #change instructions to string array not 2D array
    robot_instructions_start = 1
    grid_size = instructions_sent[0].split(' ')
    grid = Grid.new(grid_size[0],grid_size[1])
    @robot_positions = []
     while robot_instructions_start < instructions_sent.count do
       instructions = instructions_sent[robot_instructions_start,2]
       robot_position = final_robot_position_from instructions, grid
       @robot_positions << robot_position
       robot_instructions_start += 2
     end
  end

  def final_robot_position_from(instructions, grid)
    start_position = instructions[0].split(' ')
    movements = instructions[1]
    robot_position = RobotPosition.new(start_position, grid)
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
