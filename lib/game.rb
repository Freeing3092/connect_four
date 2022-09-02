require './lib/board'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :board, :player1, :player2
  
  def initialize()
    @board = Board.new
    @player1 = Player.new('Player', 'X')
    @player2 = Player.new('Hal', 'O')
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
        return true if player_consecutive_tokens >= 4
      end
    end
    return false
  end
  
end