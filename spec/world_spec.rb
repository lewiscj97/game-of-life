require 'world_new'

describe World do
  it "creates a World object with x = 10 and y = 10 when instantiated with .new(10 ,10)" do
    w = World.new(10, 10)
    x = w.x
    y = w.y
    expect(w.class).to eq World
    expect(x).to eq 10
    expect(y).to eq 10
  end

  it 'builds a 10x10 grid filled with Cell objects when .build called' do
    w = World.new(10, 10)
    w.build
    grid = w.grid
    expect(grid.size).to eq 10
    expect(grid[0].size).to eq 10
    grid.each do |row|
      row.each do |cell|
        expect(cell.class).to eq Cell
      end
    end
  end

  it 'returns a hash where the key is the coordinate of cell and value is the cell object for all cells in grid' do
    w = World.new(10, 10)
    w.build
    cells = w.cells
    expect(cells.class).to eq Hash
    cells.each do |key, value|
      expect(key.class).to eq Array
      expect(value.class).to eq Cell
    end
    cell = cells[[0,0]]
    expect(cell.x).to eq 0
    expect(cell.y).to eq 0
  end

  it 'seeds an alive cell on the grid at position 0,0 when passed .seed(0, 0)' do
    w = World.new(10, 10)
    w.build
    w.seed(0,0)
    expect(w.cells[[0,0]].alive?).to eq true
    expect(w.cells[[0,1]].alive?).to eq false
  end

  it 'displays the grid when .display called' do
    w = World.new(5, 5)
    w.build
    expect { w.display }.to output(<<-GRID).to_stdout
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
GRID
  end
end

describe '.get_neighbour_cells' do
  it 'returns the correct array of neighbouring cells when passed the cell at 0,0' do
    w = World.new(10,10)
    w.build
    cell = w.cells[[0,0]]
    neighbour_cells = w.get_neighbour_cells(cell)

    # [0,1], [1,0] and [1,1] should be neighbours
    expect(neighbour_cells[0].x).to eq 0
    expect(neighbour_cells[0].y).to eq 1

    expect(neighbour_cells[1].x).to eq 1
    expect(neighbour_cells[1].y).to eq 0

    expect(neighbour_cells[2].x).to eq 1
    expect(neighbour_cells[2].y).to eq 1
  end
end

describe '.count_neighbour_cell_states' do
  it 'returns 1 passed an array of neighbour cells and 1 is alive' do
    w = World.new(10,10)
    w.build
    w.seed(0,0)
    w.seed(0,1)
    cell = w.cells[[0,0]]
    neighbour_cells = w.get_neighbour_cells(cell)

    expect(w.count_neigbour_cell_states(neighbour_cells)).to eq 1
  end

  it 'returns 0 passed an array of neighbour cells and 0 are alive' do
    w = World.new(10,10)
    w.build
    w.seed(0,0)
    cell = w.cells[[0,0]]
    neighbour_cells = w.get_neighbour_cells(cell)

    expect(w.count_neigbour_cell_states(neighbour_cells)).to eq 0
  end

  it 'returns 3 passed an array of neighbour cells and 3 are alive' do
    w = World.new(10,10)
    w.build
    w.seed(0,0)
    w.seed(0,1)
    w.seed(1,0)
    w.seed(1,1)
    cell = w.cells[[0,0]]
    neighbour_cells = w.get_neighbour_cells(cell)

    expect(w.count_neigbour_cell_states(neighbour_cells)).to eq 3
  end
end

describe '.find_cells_to_switch' do
  it 'returns an array of cells to be switched in the next tick based on the rules' do
    w = World.new(10,10)
    w.build
    w.seed(0,0)
    w.seed(0,1)
    cell = w.cells[[0,0]]
    cells_to_switch = []
    neighbour_cells = w.get_neighbour_cells(cell)
    counter = w.count_neigbour_cell_states(neighbour_cells)
    cells_to_switch = w.find_cells_to_switch(cell, counter, cells_to_switch)
    expect(cells_to_switch.class).to eq Array
    expect(cells_to_switch[0].x).to eq cell.x
    expect(cells_to_switch[0].y).to eq cell.y
  end
end

describe '.switch_cells' do
  it 'switches cell states in cells_to_switch array' do
    w = World.new(10,10)
    w.build
    w.seed(0,0)
    w.seed(0,1)
    cell = w.cells[[0,0]]
    expect(w.cells[[0,0]].alive?).to eq true
    cells_to_switch = []
    neighbour_cells = w.get_neighbour_cells(cell)
    counter = w.count_neigbour_cell_states(neighbour_cells)
    cells_to_switch = w.find_cells_to_switch(cell, counter, cells_to_switch)
    w.switch_cells(cells_to_switch)
    expect(w.cells[[0,0]].alive?).to eq false
  end
end

describe '.seed_randomly' do
  it 'seeds the board randomly' do
    w = World.new(10,10)
    w.build
    srand(15)
    w.seed_randomly
    expect { w.display }.to output(<<-GRID).to_stdout
⬜⬛⬛⬜⬛⬜⬛⬜⬛⬜
⬛⬛⬜⬜⬛⬛⬜⬜⬛⬛
⬛⬛⬛⬛⬛⬛⬜⬛⬜⬜
⬛⬜⬜⬜⬜⬛⬛⬜⬛⬛
⬛⬜⬛⬜⬛⬛⬛⬛⬜⬜
⬛⬜⬛⬛⬜⬛⬛⬛⬜⬛
⬜⬛⬛⬛⬜⬜⬛⬛⬛⬜
⬛⬜⬛⬜⬛⬛⬜⬜⬛⬛
⬜⬛⬛⬛⬜⬛⬛⬛⬛⬛
⬛⬛⬛⬜⬛⬛⬛⬛⬛⬜
GRID
  end
end

describe '.tick' do 
  it 'runs a single tick' do
    w = World.new(5,5)
    w.build
    w.seed(0,0)
    w.seed(0,1)
    w.seed(1,2)
    w.seed(2,2)
    w.seed(3,1)
    w.seed(1,1)
    puts ""
    w.display
    w.tick
    w.display
    expect { w.display }.to output(<<-GRID).to_stdout
⬜⬜⬜⬛⬛
⬜⬛⬜⬛⬛
⬛⬛⬜⬛⬛
⬛⬛⬛⬛⬛
⬛⬛⬛⬛⬛
GRID
  end
end
