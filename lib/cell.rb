class Cell
  WHITE = true
  BLACK = false

  attr_accessor :colour

  def initialize
    @colour = WHITE
  end

  def flip!
    self.colour = !colour
  end

  def readable_colour
    self.colour == WHITE ? "W" : "B"
  end
end
