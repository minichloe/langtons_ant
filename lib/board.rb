require_relative 'cell'
require_relative 'ant'

class Board
  attr_reader :board, :ant

  def initialize(size)
    @board = create_board(size)
    @ant = Ant.new(size)
  end

  def play!(n = 1)
    n.times do
      print_board
      update_board!
    end
  end

  private

  def print_board
    p ant.current_position

    board.each do |row|
      p row.map(&:readable_colour)
    end
  end

  def update_board!
    ant.rotate!(current_cell.colour)
    current_cell.flip!
    ant.move!
  end

  def current_cell
    board[ant.row][ant.col]
  end

  def create_board(size)
    Array.new(size) do
      Array.new(size) do
        Cell.new
      end
    end
  end
end
