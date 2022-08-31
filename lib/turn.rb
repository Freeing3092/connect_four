class Turn
  attr_reader :board, :player1, :player2
  def initialize(board, player1, player2)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def valid_input_length(move)
    move.length == 1
  end
  
  def valid_input_character(letter)
    ((letter.is_a?(Integer) == false) && (@board.game_board.keys).any?(letter.upcase))
    #if false, return a message to player...input valid letter
  end
end