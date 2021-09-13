require 'game_of_life'
require 'Cell'

describe 'game_of_life' do
  it 'returns an array when initialised' do
    expect(initialise.class).to eq Array
  end

  it 'returns a 10 x 10 array filled with cells when initialised' do
    grid = initialise
    expect(grid.size).to eq 10
    grid.each do |x|
      expect(x.size).to eq 10
      x.each do |y|
        expect(y.class).to eq Cell
      end
    end
    
  #   expect(initialise()).to eq [
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
  #     [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell]
  # ]  
  end
end

describe 'Cell' do
  it 'returns "ALIVE" when a Cell is created in alive state and state is checked' do
    cell = Cell.new
    cell.set_state("ALIVE")
    expect(cell.state?).to eq "ALIVE"
  end
end