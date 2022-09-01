class Turn
  attr_reader :board, :player1, :player2
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end
  
  #Method evaluates and upcases valid input; 

  def valid_input_character?(move)
    ((move.is_a?(Integer) == false) && ((@board.game_board).has_key?(move.upcase)))
      #****if false, return a message to player...input valid move * ******
  end
  
  def player1_move(move)
    move.upcase!

    while valid_input_character?(move) == false
    puts "That is an invalid input! Please select an open column between A-G."
    move =  gets.chomp.upcase
    end
    while column_full?(move) == true ||  valid_input_character?(move) == false
      puts "That column is full! Please select another column."
      move =  gets.chomp.upcase # runner file... run prun
    end
    record_move_print_board(move, @player2) 

    if draw? == true #end of method for immediate response to conidtion
      return "The game is a draw!"
    end
  end

# Method to have the computer select a random (and not full) column
# and print the board.

  def computer_move
    move = @board.game_board.keys.sample
    if draw?
      return "The game is a draw!"
    end
    while column_full?(move)
      move = @board.game_board.keys.sample
    end
    record_move_print_board(move, @player2)
  end
  
  # Method to check if a column is full.
  

  def column_full?(move)
    # require 'pry';binding.pry
    board.game_board[move].count == 6

  end
  
  # Method to check if the entire board is full.
  
  def draw?
    board.game_board.values.flatten.count >= 42
  end
  
  # Method pushes the player's chip and prints the board
  
  def record_move_print_board(move, player) 
    @board.game_board[move].push(player.chip)
    @board.invert_board
    @board.print_board
  end

end

