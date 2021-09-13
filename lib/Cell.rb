class Cell
  def initialize
    @alive = false
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
end