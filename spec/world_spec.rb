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
    expect { w.display }.to output(<<-MESSAGE).to_stdout
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
\u2B1B\u2B1B\u2B1B\u2B1B\u2B1B
MESSAGE
  end


end
