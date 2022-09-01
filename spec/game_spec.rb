require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  let(:player) { Player.new('George', 'X') }
  let(:computer) {Player.new('Hal', 'O')}
  let(:board) {Board.new}
  let(:turn) { Turn.new(board, player, computer)}
  let(:game) {Game.new(board, player, computer)}
  
  it "is an instance of its class" do
    expect(game).to be_a Game
  end
  
  it "is initialized with 2 players and a board" do
    expect(game.player1).to eq(player)
    expect(game.player2).to eq(computer)
    expect(game.board).to eq(board)
  end
end