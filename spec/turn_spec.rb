require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  let(:player) { Player.new('George', :X) }
  let(:computer) {Player.new(:Hal, :O)}
  let(:board) {Board.new}
  let(:turn) { Turn.new(board, player, computer)}

  it 'should be an instance of a Turn class'do
    expect(turn).to be_a Turn
  end
  
  it 'accepts one character that matches the column keys and upcases it' do
    expect(turn.valid_input_character?(" ")).to eq false
    expect(turn.valid_input_character?(".")).to eq false
    expect(turn.valid_input_character?(5)).to eq false
    expect(turn.valid_input_character?("á")).to eq false
    expect(turn.valid_input_character?("BB")).to eq false
    expect(turn.valid_input_character?("C?")).to eq false
    expect(turn.valid_input_character?(:g)).to eq true
    expect(turn.valid_input_character?(:D)).to eq true
  end

  it "has a method for the computer move" do
    turn.computer_move
    board.invert_board
    expect(turn.board.horizontal_board[0].join).to eq("O")
  end

  it "has a method to check if a column is full" do
    board.game_board[:A].push(computer.chip)
    board.game_board[:A].push(computer.chip)
    board.game_board[:A].push(computer.chip)
    board.game_board[:A].push(computer.chip)
    board.game_board[:A].push(computer.chip)
    expect(turn.column_full?(:A)).to eq(false)
    board.game_board[:A].push(computer.chip)
    expect(turn.column_full?(:A)).to eq(true)
  end
  
  it "has a method to check if all columns are full" do
    expect(turn.draw?).to eq(false)
    6.times do
      board.game_board[:A].push(computer.chip)
      board.game_board[:B].push(computer.chip)
      board.game_board[:C].push(computer.chip)
      board.game_board[:D].push(computer.chip)
      board.game_board[:E].push(computer.chip)
      board.game_board[:F].push(computer.chip)
      board.game_board[:G].push(computer.chip)
    end
    expect(turn.draw?).to eq(true)
  end
end