require './lib/board'
require './lib/player'

RSpec.describe Player do
  let(:player) { Player.new('George', 'X') }
  let(:computer) {Player.new('Hal', 'O')}
  let(:board) {Board.new}

  it 'should exist as a class and have name and chip attributes'do
    expect(player).to be_a Player
    expect(player.name).to eq('George')
    expect(player.chip).to eq("X")
  end
end