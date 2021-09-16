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

  def find_cells_to_switch(cell, counter, cells_to_switch)
    if cell.alive? && counter < 2
      cells_to_switch << cell
    elsif cell.alive? && counter > 3
      cells_to_switch << cell
    elsif !cell.alive? && counter == 3
      cells_to_switch << cell
    end
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

  def tick
    cells_to_switch = []
    self.cells.each do |coordinate, cell|
      neighbour_cells = get_neighbour_cells(cell)
      counter = count_neigbour_cell_states(neighbour_cells)
      find_cells_to_switch(cell, counter, cells_to_switch)
    end
    switch_cells(cells_to_switch)
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