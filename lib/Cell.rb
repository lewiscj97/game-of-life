ALIVE = "a"
DEAD = "d"

class Cell
  def initialize(state)
    @@state = state
  end

  def state?
    return @@state
  end
end