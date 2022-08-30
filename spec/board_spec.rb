require './lib/board'

RSpec.describe Board do
  let(:board){Board.new}
  
  
  it "should be a member of its class" do
    expect(board).to be_a(Board)
    
  end
end