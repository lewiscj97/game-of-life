require_relative "cell"

@grid = []

def initialise(x, y)
  row = []

  (1..x).each do |a|
    (1..y).each do |b|
      row << Cell.new
    end
    @grid << row
    row = []
  end
end

def seed(x, y)
  @grid[x][y].alive = true
end

def display
  @grid.each do |row|
    row.each do |cell|
      print cell.alive
    end
  end
end
