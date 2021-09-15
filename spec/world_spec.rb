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

  
end
