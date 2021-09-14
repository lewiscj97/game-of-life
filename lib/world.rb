require_relative "cell"

class World
  @@grid = []
  @@cells = {}

  def initialize(x, y)
    row = []
    @x = x
    @y = y
  
    (0..x-1).each_with_index do |a, x_index|
      (0..y-1).each_with_index do |b, y_index|
        cell = Cell.new(false, x_index, y_index)
        row << cell
        @@cells[[x_index, y_index]] = cell
      end
      @@grid << row
      row = []
    end
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
# w.seed(1,1)
# w.seed(0,1)
w.seed(0,2)
w.seed(0,0)
w.seed(1,0)

w.display

cells = w.cells
cell = cells[[1,1]]

counter = 0
cell.neighbours.each do |neighbour|
  if cells[neighbour].alive == true
    counter += 1
  end
end

if cell.alive
  if counter > 3
    cell.alive=(false)
  end
else
  if counter == 3
    cell.alive=(true)
  end
end

w.display
