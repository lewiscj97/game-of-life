require 'game_of_life'

describe 'game_of_life' do
  it 'returns an array when initialised' do
    expect(initialise.class).to eq Array
  end

  # it 'returns a 10 x 10 array filled with objects when initialised' do
  #   expect(initialise()).to eq [
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object],
  #     [Object, Object, Object, Object, Object, Object, Object, Object, Object, Object]
  # ]
  # end

  it 'returns a 10 x 10 array filled with cells when initialised' do
    expect(initialise()).to eq [
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell],
      [Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell, Cell]
  ]
  end
end