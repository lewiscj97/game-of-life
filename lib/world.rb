require_relative "cell"

class World
  @@grid = []

  def initialize(x, y)
    row = []
    @x = x
    @y = y
  
    (0..x-1).each_with_index do |a, x_index|
      (0..y-1).each_with_index do |b, y_index|
        cell = Cell.new(false, x_index, y_index)
        row << cell
      end
      @@grid << row
      row = []
    end
    @@cells = @@grid.flatten
  end

  def board_size
    size = [[0, 0], [@x-1, @y-1]]
  end

  def cells
    @@cells
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
print w.board_size

cell = Cell.new(false, 0, 0)
# print cell.neighbours

# print w.cells