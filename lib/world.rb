require_relative "cell"

class World
  @@grid = []
  @@cells = {}
  @@cells_to_switch = []

  attr_reader :cells

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
  
  def seed(x, y)
    @@cells[[x,y]].alive = true
  end

  def display
    @@grid.each do |row|
      row.each do |cell|
        print cell.show
      end
      puts ""
    end
  end

  def get_neighbour_cells(cell)
    neighbour_coordinates = cell.neighbours
    neighbour_cells = []
    
    neighbour_coordinates = cell.neighbours
    neighbour_coordinates.each do |coordinates|
      neighbour_cells << @@cells[coordinates]
    end
    neighbour_cells
  end

  def count_neigbour_cell_states(cells)
    counter = 0
    cells.each do |neighbour|
      if !neighbour.nil?
        if neighbour.alive? == true
        counter += 1
        end
      end
    end
    counter
  end

  def find_cells_to_switch(cell, counter)
    if cell.alive? == true
      if counter == 2 || counter == 3
      elsif counter < 2
        @@cells_to_switch << cell
      elsif counter > 3
        @@cells_to_switch << cell
      end

    elsif cell.alive? == false
      if counter == 3
        @@cells_to_switch << cell
      end
    end
  end

  def switch_cells
    @@cells_to_switch.each do |cell|
      cell.switch
    end
    @@cells_to_switch = []
  end

  def seed_randomly
    @@cells.each do |coordinate, cell|
      if rand(10) > 5
        cell.alive = true
      end
    end
  end

  def check
    @@cells.each do |coordinate, cell|
      neighbour_cells = get_neighbour_cells(cell)
      counter = count_neigbour_cell_states(neighbour_cells)
      find_cells_to_switch(cell, counter)
    end
    switch_cells
  end

  def run
    seed_randomly
    while true
      display
      check
      sleep(0.05) 
    end
  end
end