class Cell
  @@state

  def set_state(state)
    @@state = state
  end

  def state?
    return @@state
  end
end