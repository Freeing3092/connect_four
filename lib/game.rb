require './lib/board'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :board, :player1, :player2, :winner, :turn
  
  def initialize()
    @board = Board.new
    @player1 = Player.new('Player', 'X')
    @player2 = Player.new('Hal', 'O')
    @winner = winner
    @turn = Turn.new(@board, @player1, @player2)
  end
  
  def win?(board_orientation, player)
    board_orientation.each do |vector|
      player_consecutive_tokens = 0
      vector.each do |slot|
        if slot == player.chip
          player_consecutive_tokens += 1
        else
          player_consecutive_tokens = 0
        end
        if player_consecutive_tokens >= 4
          @winner = player
          return true
        end
      end
    end
    return false
  end
  
  def play
    until win?(board.game_board.values, @player1) || win?(board.game_board.values, @player2) || win?(board.horizontal_board.values, @player1) || win?(board.horizontal_board.values, @player2) || turn.draw?
      @turn.player1_move
      @turn.computer_move
    end
    end_game
  end
  
  def end_game
    if !@turn.draw?
      puts "*~*~* #{winner.name} has won the game! *~*~*"
    elsif @turn.draw?
      puts "----- Tie game -----"
    end
  end
end