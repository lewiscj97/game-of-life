require_relative "cell"

def initialise
  grid = []
  row = []

  (1..10).each do |x|
    (1..10).each do |y|
      row << Cell
    end
    grid << row
    row = []
  end
  return grid
end