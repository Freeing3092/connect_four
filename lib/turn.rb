class Turn
  attr_reader :board, :player1, :player2
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def computer_move
    move = @board.game_board.keys.sample
    while column_full?(move)
      puts "Invalid move!"
      move = @board.game_board.keys.sample
    end
    @board.game_board[move].push(player2.chip)
    @board.invert_board
    @board.print_board
  end
  
  def column_full?(move)
    board.game_board[move].count == 6
  end
  
end