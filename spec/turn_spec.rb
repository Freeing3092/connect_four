require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  let(:player) { Player.new('George', 'X') }
  let(:computer) {Player.new('Hal', 'O')}
  let(:board) {Board.new}
  let(:game) { Turn.new}

  it 'should be an instance of a Turn class'do
    expect(game).to be_a Turn
  end


end