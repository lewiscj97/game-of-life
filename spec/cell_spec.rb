require 'cell'

describe Cell do
  it "creates an object of Cell type when initialised" do
    cell = Cell.new(false, 0, 0)
    expect(cell.class).to eq Cell
  end

  it "returns the cell instances state when passed .alive?" do
    cell = Cell.new(false, 0, 0)
    expect(cell.alive?).to eq false
  end

  it "returns false when .alive? passed to an alive cell that has had it's state switched" do
    cell = Cell.new(true, 0, 0)
    cell.switch
    expect(cell.alive?).to eq false
  end

  it "returns a black square when .show passed to a dead cell" do
    cell = Cell.new(false, 0, 0)
    expect(cell.show).to eq "\u2B1B"
  end

  it "returns a white square when .show passed to a dead cell" do
    cell = Cell.new(true, 0, 0)
    expect(cell.show).to eq "\u2B1C"
  end

  it "returns the coordinates of it's neighbouring cells when .neighbours passed to a cell" do
    cell = Cell.new(true, 0, 0)
    expected = [
      [-1, -1], [-1, 0], [-1, 1],
      [0, -1], [0, 1],
      [1, -1], [1, 0], [1, 1]
    ]
    expect(cell.neighbours).to eq expected
  end
end