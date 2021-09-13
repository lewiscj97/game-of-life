require 'game_of_life'

describe 'game_of_life' do
  it 'returns an array when initialised' do
    expect(initialise()).to eq Array
  end
end