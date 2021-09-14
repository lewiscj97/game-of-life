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

  def check
    cells_to_switch = []
    @@cells.each do |coordinate, cell|
      counter = 0
      neighbour_coordinates = cell.neighbours
      neighbour_cells = []

      neighbour_coordinates.each do |coordinates|
        neighbour_cells << @@cells[coordinates]
      end

      neighbour_cells.each do |neighbour|
        if !neighbour.nil?
          if neighbour.alive == true
          counter += 1
          end
        end
      end
      
      if cell.alive == true
        if counter == 2 || counter == 3
          # cell.alive=(true)
        elsif counter < 2
          # cell.alive=(false)
          cells_to_switch << cell
        elsif counter > 3
          # cell.alive=(false)
          cells_to_switch << cell
        end

      elsif cell.alive == false
        if counter == 3
          # cell.alive=(true)
          cells_to_switch << cell
        end
      end
    end
    cells_to_switch.each do |cell|
      cell.switch
    end
  end    
end

w = World.new(10,10)
w.seed(1,1)
w.seed(0,1)
w.seed(0,0)
w.seed(1,0)
w.seed(2,3)

w.display
puts ""

w.check
puts ""

w.display