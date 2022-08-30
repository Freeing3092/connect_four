require './lib/board'

RSpec.describe Board do
  let(:board){Board.new}
  
  it "should be a member of its class" do
    expect(board).to be_a(Board)  
  end

  it 'should have a game_board attribute that is a hash' do
    expect(board.game_board).to be_a Hash
  end
  
  it 'should have a hash keys from A-G with empty array values' do
    # require 'pry';binding.pry
    expect(board.game_board['A']).to eq([])
    expect(board.game_board['B']).to eq([])
    expect(board.game_board['C']).to eq([])
    expect(board.game_board['D']).to eq([])
    expect(board.game_board['E']).to eq([])
    expect(board.game_board['F']).to eq([])
    expect(board.game_board['G']).to eq([])
  end

  it 'should not have keys other than A-G' do
    expect(board.game_board['H']).to eq nil
    expect(board.game_board['M']).to eq nil
    expect(board.game_board['Z']).to eq nil
  end




end