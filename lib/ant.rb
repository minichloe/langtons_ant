require_relative 'cell'

class Ant
  NORTH = "North"
  EAST = "East"
  SOUTH = "South"
  WEST = "West"

  DIRECTIONS = {
    0 => NORTH,
    1 => EAST,
    2 => SOUTH,
    3 => WEST,
  }

  attr_accessor :direction, :board_size, :row, :col

  def initialize(board_size)
    @board_size = board_size
    @direction = 0
    @row = board_size/2
    @col = board_size/2
  end

  def move!
    ant_row = row
    ant_col = col

    case DIRECTIONS[self.direction]
    when NORTH
      ant_row = (row - 1) % board_size
    when EAST
      ant_col = (col + 1) % board_size
    when SOUTH
      ant_row = (row + 1) % board_size
    when WEST
      ant_col = (col - 1) % board_size
    end

    set_position(ant_row, ant_col)
  end

  def rotate!(colour)
    if colour == Cell::WHITE
      rotate_clockwise!
    else
      rotate_counter_clockwise!
    end
  end

  def current_position
    {
      location: [row, col],
      direction: DIRECTIONS[direction]
    }
  end

  private

  def set_position(row, col)
    self.row = row
    self.col = col
  end

  def rotate_clockwise!
    self.direction = (self.direction + 1) % 4
  end

  def rotate_counter_clockwise!
    self.direction = (self.direction - 1) % 4
  end
end
