class Cell
  @@state

  def display
    outcome = ""
    if self.state? == "ALIVE"
      outcome = "\u25A0"
    elsif self.state? == "DEAD"
      outcome = "\u25A1"
    end
  end

  def set_state(state)
    @@state = state
  end

  def state?
    return @@state
  end
end