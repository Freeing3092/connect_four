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
  
  it "#win? method to check for vertical win conditions" do
    expect(game.win?(game.board.game_board.values, game.player1)).to eq(false)
    4.times do
      game.board.game_board['B'].push(game.player1.chip)
    end
    expect(game.win?(game.board.game_board.values, game.player1)).to eq(true)
  end
  
  it "#win? method can check for horizontal win conditions" do
    
    game.board.invert_board
    expect(game.win?(game.board.horizontal_board.values, game.player2)).to eq(false)
    game.board.game_board['C'].push(game.player2.chip)
    game.board.game_board['D'].push(game.player2.chip)
    game.board.game_board['E'].push(game.player2.chip)
    game.board.game_board['F'].push(game.player2.chip)
    game.board.invert_board
    
    expect(game.win?(game.board.horizontal_board.values, game.player2)).to eq(true)
  end


 




























end