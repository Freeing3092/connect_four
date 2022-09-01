require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  let(:player) { Player.new('George', 'X') }
  let(:computer) {Player.new('Hal', 'O')}
  let(:board) {Board.new}
  let(:turn) { Turn.new(board, player, computer)}

  it 'should be an instance of a Turn class'do
    expect(turn).to be_a Turn
  end
  
  context 'tests player actions' do
    it 'accepts one character that matches the column keys and upcases it' do
     
    
      move = " "
      expect(turn.valid_input_character?(move)).to eq false
      move = "."
      expect(turn.valid_input_character?(move)).to eq false
      move = 5
      expect(turn.valid_input_character?(move)).to eq false
      move = "á"
      expect(turn.valid_input_character?(move)).to eq false
      move = "BB"
      expect(turn.valid_input_character?(move)).to eq false
      move = "C?"
      expect(turn.valid_input_character?(move)).to eq false
      move = "g"
      expect(turn.valid_input_character?(move)).to eq true
      move = 'D'
      expect(turn.valid_input_character?(move)).to eq true
    end

    it 'checks for a draw scenario and if the column is full before player move'do
      expect(turn.draw?).to eq false
      5.times do
        board.game_board['E'].push(computer.chip)
      end
      turn.player1_move('e')
      # require 'pry';binding.pry
      expect(board.game_board['E'].count).to eq(6)
      turn.player1_move('a')
      expect(turn.column_full?('A')).to eq(false)
    end


  end 

  it "has a method for the computer move" do
    turn.computer_move
    board.invert_board
    expect(turn.board.horizontal_board[0].join).to eq('O')
  end

  it "has a method to check if a column is full" do
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    board.game_board['A'].push(computer.chip)
    expect(turn.column_full?('A')).to eq(false)
    board.game_board['A'].push(computer.chip)
    expect(turn.column_full?('A')).to eq(true)
  end
  
  it "has a method to check if all columns are full" do
    expect(turn.draw?).to eq(false)
    6.times do
      board.game_board['A'].push(computer.chip)
      board.game_board['B'].push(computer.chip)
      board.game_board['C'].push(computer.chip)
      board.game_board['D'].push(computer.chip)
      board.game_board['E'].push(computer.chip)
      board.game_board['F'].push(computer.chip)
      board.game_board['G'].push(computer.chip)
    end
    expect(turn.draw?).to eq(true)
  end
end