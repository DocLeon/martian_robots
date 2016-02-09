class RobotPosition
  def initialize(start_position, grid)
    @x_coordinate = start_position[0].to_i
    @y_coordinate = start_position[1].to_i
    @orientation = start_position[2]
    @grid = grid
  end

  def move(movement)
    compass_points = ['N','E','S','W']
    movement.each_char do |movement|
      if @orientation.include? 'LOST'
        adjustment = orientation_adjustment_from movement
        final_compass_index = compass_points.index(@orientation) + adjustment
        final_compass_index = 0 if final_compass_index > 3
        @orientation = compass_points[final_compass_index]
        move_forward(@orientation) if movement == 'F'
      end
    end
  end

  def move_forward(orientation)
    @y_coordinate += 1 if orientation == 'N'
    @y_coordinate -= 1 if orientation == 'S'
    @x_coordinate -= 1 if orientation == 'W'
    @x_coordinate += 1 if orientation == 'E'
    if @y_coordinate > @grid[1].to_i
      @y_coordinate = @grid[1].to_i
      @orientation = "#{@orientation} LOST"
      #mark position in grid 'ghost'
      #check for < 0
    end
    if @x_coordinate > @grid[0].to_i
      @x_coordinate = @grid[0].to_i
      @orientation = "#{@orientation} LOST"
      #mark position in grid 'ghost'
      #check for < 0
    end
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
