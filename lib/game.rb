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
  
end