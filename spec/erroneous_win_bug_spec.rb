require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Board do
  let(:game) {Game.new}
  
  it "doesn't have an erroneous win conidtion" do
    game.board.game_board['A'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['A'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['A'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['B'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['A'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['C'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['A'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['G'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['D'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['D'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['C'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['G'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['D'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['G'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['F'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['D'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['D'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['F'].push('O')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['F'].push('X')
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    game.board.game_board['F'].push('O')
    
    game.board.invert_board
    game.board.invert_board_diagonal
    print "\n"
    game.board.print_board
    # require "pry"; binding.pry
    expect(game.win?(game.board.game_board.values, game.player2)).to eq(false)
    expect(game.win?(game.board.horizontal_board.values, game.player2)).to eq(false)
    expect(game.win?(game.board.diagonal_board.values, game.player2)).to eq(false)
  end
end