class Grid
  attr_reader :max_x
  attr_reader :max_y
  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
    @grid = Array.new(@max_x + 1)
    @grid.map!{Array.new(@max_y + 1)}
  end
  def mark(position)
    x = position[0]
    y = position[1]
    @grid[x][y] = true
  end
  def is_not_scented?(position)
    !@grid[position[0]][position[1]]
  end
end
