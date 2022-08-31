require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  let(:player) { Player.new('George', 'X') }
  let(:computer) {Player.new('Hal', 'O')}
  let(:board) {Board.new}
  let(:game) { Turn.new(board, player, computer)}

  it 'should be an instance of a Turn class'do
    expect(game).to be_a Turn
  end
  
  it "has a method for the computer move" do
    game.computer_move
    board.invert_board
    expect(game.board.horizontal_board[0].join).to eq('O')
  end


end