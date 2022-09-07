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
    expect(game.player2.name).to eq(:Hal)
    expect(game.board).to be_a Board
  end
  
  it "#win? method to check for vertical win conditions" do
    expect(game.win?(game.board.game_board.values)).to eq(false)
    4.times do
      game.board.game_board[:B].push(game.player1.chip)
    end
    expect(game.win?(game.board.game_board.values)).to eq(true)
  end
  
  it "#win? method can check for horizontal win conditions" do
    
    game.board.invert_board
    expect(game.win?(game.board.horizontal_board.values)).to eq(false)
    game.board.game_board[:C].push(game.player2.chip)
    game.board.game_board[:D].push(game.player2.chip)
    game.board.game_board[:E].push(game.player2.chip)
    game.board.game_board[:F].push(game.player2.chip)
    game.board.invert_board
    expect(game.win?(game.board.horizontal_board.values)).to eq(true)
  end
  
  it "#win? method can check for diagonal win conditions" do
    
    game.board.invert_board
    game.board.import_diagonal_board
    expect(game.win?(game.board.diagonal_board)).to eq(false)
    game.board.game_board[:A].push(game.player1.chip)
    game.board.game_board[:B].push(game.player2.chip)
    game.board.game_board[:B].push(game.player1.chip)
    game.board.game_board[:C].push(game.player2.chip)
    game.board.game_board[:G].push(game.player1.chip)
    game.board.game_board[:C].push(game.player2.chip)
    game.board.game_board[:C].push(game.player1.chip)
    game.board.game_board[:D].push(game.player2.chip)
    game.board.game_board[:D].push(game.player1.chip)
    game.board.game_board[:G].push(game.player2.chip)
    game.board.game_board[:D].push(game.player1.chip)
    game.board.game_board[:G].push(game.player2.chip)
    game.board.game_board[:D].push(game.player1.chip)
    
    game.board.invert_board
    game.board.import_diagonal_board
    puts '\n'
    game.board.print_board
    expect(game.win?(game.board.diagonal_board)).to eq(true)
  end

  it'should put a welcome message' do
    expect { game.welcome_message }.to output("\nWelcome to CONNECT FOUR!\nEnter p to play. Enter q to quit.\n").to_stdout
  end
  
  it "doesn't have an erroneous win conidtion" do
    game.board.game_board[:A].push(:X)
    game.board.game_board[:A].push(:O)
    game.board.game_board[:A].push(:X)
    game.board.game_board[:B].push(:O)
    game.board.game_board[:A].push(:X)
    game.board.game_board[:C].push(:O)
    game.board.game_board[:A].push(:X)
    game.board.game_board[:G].push(:O)
    game.board.game_board[:D].push(:X)
    game.board.game_board[:D].push(:O)
    game.board.game_board[:C].push(:X)
    game.board.game_board[:G].push(:O)
    game.board.game_board[:D].push(:X)
    game.board.game_board[:G].push(:O)
    game.board.game_board[:F].push(:X)
    game.board.game_board[:D].push(:O)
    game.board.game_board[:D].push(:X)
    game.board.game_board[:F].push(:O)
    game.board.game_board[:F].push(:X)
    game.board.game_board[:F].push(:O)
    
    game.board.invert_board
    game.board.import_diagonal_board
    print "\n"
    game.board.print_board
    expect(game.win?(game.board.game_board.values)).to eq(false)
    expect(game.win?(game.board.horizontal_board.values)).to eq(false)
    expect(game.win?(game.board.diagonal_board)).to eq(false)
  end

end