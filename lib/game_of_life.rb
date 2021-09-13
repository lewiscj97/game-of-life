require_relative "cell"

def initialise
  grid = []
  row = []

  (1..10).each do |x|
    (1..10).each do |y|
      cell = Cell.new
      row << cell
    end
    grid << row
    row = []
  end
  return grid
end

puts "\u25A1"