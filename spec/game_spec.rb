require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  let(:game) {Game.new}
  
  it "is an instance of its class" do
    expect(game).to be_a Game
  end
  
  it "is initialized with 2 players and a board" do
    expect(game.player1.name).to eq("Player")
    expect(game.player2.name).to eq("Hal")
    expect(game.board).to be_a Board
  end
end