class Position
  attr_reader :x_coordinate
  attr_reader :y_coordinate
  def self.from(start_position,movements)
    Position.new(start_position, movements)
  end

  def initialize(co_ords, movements)
    @x_coordinate = co_ords[0]
    @y_coordinate = co_ords[1]
    @original_orientation = co_ords[2]
    @orientation = move(movements)
  end

  def move(movement)
    return orientation_from(@original_orientation, movement)
  end

  def orientation_from(original_orientation, movement)
    compass_points = ['N','E','S','W']
    final_orientation = original_orientation
    movement.each_char do |movement|
      move_forward(final_orientation) if movement == 'F'
      adjustment = orientation_adjustment_from movement
      final_compass_index = compass_points.index(final_orientation) + adjustment
      final_compass_index = 0 if final_compass_index > 3
      final_orientation = compass_points[final_compass_index]
    end
    final_orientation
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
