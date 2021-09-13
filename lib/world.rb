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

initialise(10, 10)
seed(0,0)
seed(0,1)
seed(0,2)
seed(0,3)
seed(0,4)
display
