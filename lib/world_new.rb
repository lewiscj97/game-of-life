require_relative "cell"

class World
  attr_reader :x
  attr_reader :y
  attr_reader :grid
  attr_reader :cells

  def initialize(x, y)
    @x = x
    @y = y
  end

  def build
    row = []
    grid = []
    cells = {}

    (0..self.x-1).each_with_index do |a, x_index|
      (0..self.y-1).each_with_index do |b, y_index|
        cell = Cell.new(false, x_index, y_index)
        row << cell
        cells[[x_index, y_index]] = cell
      end
      grid << row
      row = []
    end
    @grid = grid
    @cells = cells
  end

  def seed(x, y)
    self.cells[[x,y]].alive = true
  end

  def display
    self.grid.each do |row|
      row.each do |cell|
        print cell.show
      end
      print "\n"
    end
  end

  def get_neighbour_cells(cell)
    neighbour_coordinates = cell.neighbours
    neighbour_cells = []
    
    neighbour_coordinates = cell.neighbours
    neighbour_coordinates.each do |coordinates|
      neighbour_cells << self.cells[coordinates]
    end
    neighbour_cells
  end
end

w = World.new(10,10)
w.build
# w.seed(0,0)
# w.seed(0,1)
w.display
