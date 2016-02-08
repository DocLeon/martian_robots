class RobotPosition
  def initialize(start_position, movements)
    @x_coordinate = start_position[0]
    @y_coordinate = start_position[1]
    @orientation = start_position[2]
    move(movements)
  end

  def move(movement)
    compass_points = ['N','E','S','W']
    movement.each_char do |movement|
      move_forward(@orientation) if movement == 'F'
      adjustment = orientation_adjustment_from movement
      final_compass_index = compass_points.index(@orientation) + adjustment
      final_compass_index = 0 if final_compass_index > 3
      @orientation = compass_points[final_compass_index]
    end
  end

  def move_forward(orientation)
    @y_coordinate = (@y_coordinate.to_i + 1).to_s if orientation == 'N'
    @y_coordinate = (@y_coordinate.to_i - 1).to_s if orientation == 'S'
    @x_coordinate = (@x_coordinate.to_i - 1).to_s if orientation == 'W'
    @x_coordinate = (@x_coordinate.to_i + 1).to_s if orientation == 'E'
  end

  def orientation_adjustment_from(movement)
    return 1 if movement == "R"
    return -1 if movement == "L"
    0
  end

  def to_s
    "#{@x_coordinate} #{@y_coordinate} #{@orientation}"
  end
end
