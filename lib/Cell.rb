class Cell
  def initialize(alive, x, y)
    @alive = alive
    @x = x
    @y = y
  end

  def x 
    @x
  end

  def y
    @y
  end
  
  def alive
    @alive
  end
  
  def alive=(alive)
    @alive = alive
  end

  def show
    self.alive ? "\u2B1C" : "\u2B1B"
  end

  def neighbours
    neighbours = []
    neighbours.push([self.x - 1, self.y - 1])
    neighbours.push([self.x - 1, self.y])
    neighbours.push([self.x - 1, self.y + 1])

    neighbours.push([self.x, self.y - 1])
    neighbours.push([self.x, self.y + 1])

    neighbours.push([self.x + 1, self.y - 1])
    neighbours.push([self.x + 1, self.y])
    neighbours.push([self.x + 1, self.y + 1])
    
    neighbours
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end