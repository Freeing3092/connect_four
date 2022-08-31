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

  it "has a method to check if a column is full" do
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    expect(game.column_full?('A')).to eq(false)
    board.game_board['A'].push(computer.chip)
    expect(game.column_full?('A')).to eq(true)
  end
  
  it "has a method to check if all columns are full" do
    expect(game.draw?).to eq(false)
    6.times do
      board.game_board['A'].push(computer.chip)
      board.game_board['B'].push(computer.chip)
      board.game_board['C'].push(computer.chip)
      board.game_board['D'].push(computer.chip)
      board.game_board['E'].push(computer.chip)
      board.game_board['F'].push(computer.chip)
      board.game_board['G'].push(computer.chip)
    end
    expect(game.draw?).to eq(true)
  end
end