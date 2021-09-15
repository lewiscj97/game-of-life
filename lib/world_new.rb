require_relative "cell"

class World
  GLIDER = [
    [5,1], [5,2], [6,1], [6,2], [5,11], [6,11], [7,11],
    [4,12], [8,12], [9,13], [9,14], [3,13], [3,14], [6,15],
    [4,16], [8,16], [5,17], [6,17], [7,17], [6,18], [3,21],
    [4,21], [5,21], [3,22], [4,22], [5,22], [2,23], [6,23],
    [1,25], [2,25], [6,25], [7,25], [3,35], [3,36], [4,35],
    [4,36]
  ]

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
    neighbour_cells = []
    
    neighbour_coordinates = cell.neighbours
    neighbour_coordinates.each do |coordinates|
      neighbour_cells << self.cells[coordinates] if !self.cells[coordinates].nil?
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

  def switch_cells(cells_to_switch)
    cells_to_switch.each do |cell|
      cell.switch
    end
  end

  def seed_randomly
    self.cells.each do |coordinate, cell|
      if rand(10) > 5
        cell.alive = true
      end
    end
  end

  def find_cells_to_switch(cell, counter, cells_to_switch)
    if cell.alive? && counter < 2
      cells_to_switch << cell
    elsif cell.alive? && counter > 3
      cells_to_switch << cell
    elsif !cell.alive? && counter == 3
      cells_to_switch << cell
    end
  end

  def tick
    cells_to_switch = []
    self.cells.each do |coordinate, cell|
      neighbour_cells = get_neighbour_cells(cell)
      counter = count_neigbour_cell_states(neighbour_cells)
      find_cells_to_switch(cell, counter, cells_to_switch)
    end
    switch_cells(cells_to_switch)
  end

  def seed_glider
    GLIDER.each do |coordinate|
      x, y = coordinate
      seed(x,y)
    end
  end

  def run
    while true
      display
      tick
      sleep(0.05)
      puts ""
    end
  end
end