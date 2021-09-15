require_relative "cell"

class World
  attr_reader :x
  attr_reader :y
  attr_reader :grid
  attr_reader :cells
  attr_reader :cells_to_switch

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

  def count_neigbour_cell_states(cells)
    counter = 0
    cells.each do |neighbour|
      if !neighbour.nil? && neighbour.alive? == true
        counter += 1
      end
    end
    counter
  end

  def find_cells_to_switch(cell, counter)
    cells_to_switch = []
    if cell.alive? && counter < 2
      cells_to_switch << cell
    elsif cell.alive? && counter > 3
      cells_to_switch << cell
    elsif !cell.alive? && counter == 3
      cells_to_switch << cell
    end
    @cells_to_switch = cells_to_switch
  end
end

w = World.new(10,10)
w.build
w.seed(0,0)
w.seed(0,1)
# w.display
cell = w.cells[[0,0]]
neighbour_cells = w.get_neighbour_cells(cell)
counter =  w.count_neigbour_cell_states(neighbour_cells)
puts "Switch: #{w.find_cells_to_switch(cell, counter)}"

