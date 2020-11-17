require_relative 'lib/board'

p "Enter the size of the board (integer 1-20)"

size = gets.chomp&.to_i

if size > 20
  p "Please enter an integer between 1-20"
end

size = gets.chomp&.to_i
board = Board.new(size)

p "Board created! How many moves do you want to see?"
moves = gets.chomp&.to_i

board.play!(moves)
