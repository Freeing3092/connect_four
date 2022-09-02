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
  
  def win?
    board.game_board.values.each do |row|
      player_consecutive_tokens = 0
      computer_consecutive_tokens = 0
      row.each do |slot|
        if slot == 'X'
          computer_consecutive_tokens = 0
          player_consecutive_tokens += 1
        elsif slot == 'O'
          player_consecutive_tokens = 0
          computer_consecutive_tokens += 1
        end
        if player_consecutive_tokens >= 4 || computer_consecutive_tokens >= 4
          return true
        end
      end
    end
    return false
  end
  
end