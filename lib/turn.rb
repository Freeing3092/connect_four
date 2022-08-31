class Turn
  attr_reader :board, :player1, :player2, :move
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @move = move
  end

  def computer_move
    @move = @board.game_board.keys.sample
    @board.game_board[move].push(player2.chip)
  end
  

end