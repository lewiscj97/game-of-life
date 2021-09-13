require_relative "cell"

@grid = []

def initialise(x, y)
  @MAX_X = x
  @MAX_Y = y
  
  row = []

  (1..x).each do |a|
    (1..y).each do |b|
      row << Cell.new(false, x, y)
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
      print cell.show
    end
    puts ""
  end
end

def logic(x, y)
  counter = 0
  # if @grid[x-1][y-1].alive == true
  #   counter += 1 unless x - 1 < 0 || y - 1 < 0
  # end
  
  # if @grid[x-1][y].alive == true
  #   counter += 1 unless x - 1 < 0 || y - 1 < 0
  # end
  
  # if @grid[x-1][y+1].alive == true
  #   counter += 1 unless x - 1 < 0 || y - 1 < 0
  # end
  
  # if @grid[x][y-1].alive == true
  #   counter += 1 unless x - 1 < 0 || y - 1 < 0
  # end
  
  # if @grid[x][y+1].alive == true
  #   counter += 1
  # end
  
  # if @grid[x+1][y-1].alive == true
  #   counter += 1 unless x - 1 < 0 || y - 1 < 0
  # end
  
  # if @grid[x+1][y].alive == true
  #   counter += 1
  # end
  
  # if @grid[x+1][y+1].alive == true
  #   counter += 1
  # end
  
  # puts counter
end

initialise(10,10)
seed(0,9)

display
