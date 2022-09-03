class Turn
  attr_reader :board, :player1, :player2
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end
  
  #Method evaluates and upcases valid input; 

  def valid_input_character?(move)
    # require 'pry';binding.pry
    ((move.is_a?(Integer) == false) && ((@board.game_board).has_key?(move.upcase)))

    # move.length == 1
      #****if false, return a message to player...input valid move * ******
  end
  
    # this method calls for the player to make a move, evaluates the move, 
    #and inputs valid moves onto the board
    
  def is_move_invalid?(move)
    #check for invalid 
    while (valid_input_character?(move) == false) 
      puts "That is an invalid input! Please select an open column between A-G."
      move =  gets.chomp.upcase
    end
      
    if (valid_input_character?(move)  == true ) 
       (column_full?(move) == false)
      # record_move_print_board(move, @player1)
        while (valid_input_character?(move) == false ) || (column_full?(move) == true)
          puts "That is an invalid input! Please select an open column between A-G."
          move =  gets.chomp.upcase
          # (valid_input_character?(move) == false) && move.length == 1
      end

    end
    record_move_print_board(move, @player1)
  end

  def player1_move
    if draw? == true #end of method for immediate response to conidtion
      return "The game is a draw!"
    end

    move =  gets.chomp.upcase
    
    is_move_invalid?(move)
    # while valid_input_character?(move) == false
    # puts "That is an invalid input! Please select an open column between A-G."
    # move =  gets.chomp.upcase
    # end

    # while column_full?(move) == true
      # require 'pry';binding.pry
        # if valid_input_character?(move) == false
          # puts "That column is full! Please select another column."
          # move =  gets.chomp.upcase
          # player1_move
          # is_move_invalid?(move)
        # else
          # valid_input_character?(move) == true
          # break
        # end
        # next
    # end
    # record_move_print_board(move, @player1) 
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
    @board.invert_board_diagonal
    @board.print_board
  end
end