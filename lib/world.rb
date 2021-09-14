require_relative "cell"

class World
  @@grid = []
  @cells = []

  def initialize(x, y)
    row = []
  
    (0..x-1).each_with_index do |a, x_index|
      (0..y-1).each_with_index do |b, y_index|
        row << Cell.new(false, x_index, y_index)
      end
      @@grid << row
      row = []
    end
  end
  
  def seed(x, y)
    @@grid[x][y].alive = true
  end

  def display
    @@grid.each do |row|
      row.each do |cell|
        print cell.show
      end
      puts ""
    end
  end
end

w = World.new(10,10)
w.seed(0,9)
w.seed(0,5)
w.display
