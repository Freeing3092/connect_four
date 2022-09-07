class Turn
  attr_reader :board, :player1, :player2
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end
  
  #Method takes in a player1 move and runs it through the assessment steps
  def player1_move
    move = gets.chomp.upcase.to_sym
    is_move_invalid?(move)
  end

  # Method to have the computer select a random (and not full) column
  # and print the board.
  def computer_move
    move = @board.game_board.keys.sample
    while column_full?(move)
      move = @board.game_board.keys.sample
    end
    record_move_print_board(move, @player2)
  end
  
  # Method to check if a column is full.
  def column_full?(move)
    board.game_board[move].count == 6
  end
  
  # Method to check if the entire board is full.
  def draw?
    board.game_board.values.flatten.count >= 42
  end
  
  # Method pushes the player's chip and prints the board.
  def record_move_print_board(move, player) 
    @board.game_board[move].push(player.chip)
    @board.invert_board
    @board.import_diagonal_board
    @board.print_board
  end

   #Helper Methods valid_input_character? and is_move_invalid? evaluate player input.
  def valid_input_character?(move)
    ((move.is_a?(Integer) == false) && ((@board.game_board).has_key?(move.upcase)))
  end
    
  def is_move_invalid?(move)
    #if input is invalid 
    while (valid_input_character?(move) == false) 
      puts "That is an invalid input! Please select an open column between A-G."
      move = gets.chomp.upcase.to_sym
    end
    # if input valid
    if (valid_input_character?(move)  == true ) 
       (column_full?(move) == false)

       #if input is valid check for full column, recheck input then column status; if either is true loop.
        while (valid_input_character?(move) == false ) || (column_full?(move) == true)
          puts "Invalid input! Please select an open column between A-G."
          move = gets.chomp.upcase.to_sym
      end
    end
    record_move_print_board(move, @player1)
  end
end