require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  let(:player1) { Player.new('George', 'X') }
  let(:player2) {Player.new('Hal', 'O')}
  let(:board) {Board.new}
  let(:turn) {Turn.new(board,player1,player2)}

  it 'should be an instance of a Turn class'do
    expect(turn).to be_a Turn
  end

  it 'should recieve a single input from players'do
    move = "ABBA"
    expect(turn.valid_input_length(move)).to eq false
    move = "V0"
    expect(turn.valid_input_length(move)).to eq false
    move = ""
    expect(turn.valid_input_length(move)).to eq false
    move = "*"
    expect(turn.valid_input_length(move)).to eq true
    move = "h"
    expect(turn.valid_input_length(move)).to eq true
  end

  it 'should accept input only if it matches the board keys' do
    letter = " "
    expect(turn.valid_input_character(letter)).to eq false
    letter = "*"
    expect(turn.valid_input_character(letter)).to eq false
    letter = "5"
    expect(turn.valid_input_character(letter)).to eq false
    letter = 5
    expect(turn.valid_input_character(letter)).to eq false
    letter = "á"
    expect(turn.valid_input_character(letter)).to eq false
    letter = "."
    expect(turn.valid_input_character(letter)).to eq false
    letter = "g"
    expect(turn.valid_input_character(letter)).to eq true
    letter = 'D'
    expect(turn.valid_input_character(letter)).to eq true
  end

end