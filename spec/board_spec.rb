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
    expect(board.game_board[:A]).to eq([])
    expect(board.game_board[:B]).to eq([])
    expect(board.game_board[:C]).to eq([])
    expect(board.game_board[:D]).to eq([])
    expect(board.game_board[:E]).to eq([])
    expect(board.game_board[:F]).to eq([])
    expect(board.game_board[:G]).to eq([])
  end

  it 'should not have keys other than A-G' do
    expect(board.game_board[:H]).to eq nil
    expect(board.game_board[:M]).to eq nil
    expect(board.game_board[:Z]).to eq nil
  end

  it 'should have an attribute for a inverted hash of game_board' do
    board.game_board[:B].push(:X)
    board.game_board[:B].push(:O)
    board.game_board[:C].push(:X)
    board.game_board[:D].push(:O)
    board.invert_board
    
    expect(board.horizontal_board[0]).to eq([nil, :X, :X, :O, nil, nil, nil])
    expect(board.horizontal_board[1]).to eq([nil, :O, nil, nil, nil, nil, nil])
    expect(board.horizontal_board[2]).to eq([nil, nil, nil, nil, nil, nil, nil])
    expect(board.horizontal_board[3]).to eq([nil, nil, nil, nil, nil, nil, nil])
    expect(board.horizontal_board[4]).to eq([nil, nil, nil, nil, nil, nil, nil])
    expect(board.horizontal_board[5]).to eq([nil, nil, nil, nil, nil, nil, nil])
    print "\n"
    board.print_board
  end

  it 'should have an attribute for a diagonal board' do
    board.game_board[:A].push(:X)
    board.game_board[:A].push(:O)
    board.game_board[:B].push(:X)
    board.game_board[:B].push(:O)
    board.game_board[:C].push(:X)
    board.game_board[:D].push(:O)
    board.game_board[:D].push(:X)
    board.game_board[:D].push(:O)
    board.game_board[:C].push(:X)
    board.game_board[:C].push(:O)
    board.game_board[:E].push(:X)
    board.game_board[:E].push(:O)
    board.game_board[:E].push(:X)
    board.game_board[:E].push(:O)
    
    board.invert_board
    board.import_diagonal_board
    
    print "\n"
    board.print_board
    
    expect(board.diagonal_board[0]).to eq([nil, nil, nil, :O, :O, nil])
    expect(board.diagonal_board[3]).to eq([nil, nil, nil, :X, nil, nil])
    expect(board.diagonal_board[6]).to eq([:X, :O, :O, nil, nil, nil])
    expect(board.diagonal_board[9]).to eq([:X, :X, :O, :O, nil, nil])
    expect(board.diagonal_board[11]).to eq([:O, :O, nil, nil])
  end
end