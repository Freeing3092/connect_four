class Turn
  attr_reader :board, :player1, :player2
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def valid_input_length(move)
    move.length == 1
  end
  
  def valid_input_character(letter)
    ((letter.is_a?(Integer) == false) && (@board.game_board.keys).any?(letter.upcase))
    #if false, return a message to player...input valid letter
  end

# Method to have the computer select a random (and not full) column
# and print the board.

  def computer_move
    move = @board.game_board.keys.sample
    if draw?
      return "The game is a draw!"
    end
    while column_full?(move)
      puts "Invalid move!"
      move = @board.game_board.keys.sample
    end
    @board.game_board[move].push(player2.chip)
    @board.invert_board
    @board.print_board
  end
  
  # Method to check if a column is full.
  
  def column_full?(move)
    board.game_board[move].count == 6
  end
  
  # Method to check if the entire board is full.
  
  def draw?
    board.game_board.values.flatten.count >= 42
  end
  
end