class Cell
  def initialize(alive, x, y)
    @alive = alive
    @x = x
    @y = y
  end

  attr_reader :x
  attr_reader :y
  attr_reader :alive
  attr_writer :alive

  def switch
    @alive = !@alive
  end

  def show
    self.alive ? "\u2B1C" : "\u2B1B"
  end

  def neighbours
    neighbours = [
      [self.x - 1, self.y - 1], [self.x - 1, self.y], [self.x - 1, self.y + 1],
      [self.x, self.y - 1], [self.x, self.y + 1],
      [self.x + 1, self.y - 1], [self.x + 1, self.y], [self.x + 1, self.y + 1] 
    ]
  end
end