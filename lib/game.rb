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
    until game_over?(@player2)
      @turn.player1_move
      break if game_over?(@player1)
      @turn.computer_move
    end
    end_game
  end
  
  def game_over?(player)
    win?(board.game_board.values, player) || 
    win?(board.horizontal_board.values, player) || 
    win?(board.diagonal_board.values, player) || 
    turn.draw?
  end
  
  def end_game
    if !@turn.draw?
      puts "*~*~* #{winner.name} has won the game! *~*~*"
    elsif @turn.draw?
      puts "----- Tie game -----"
    end
  end










































  def start
    @board.welcome_message

    puts "Enter p to play. Enter q to quit.\n"
    user_input = gets.chomp

    # require 'pry';binding.pry
    if (user_input.is_a?(Integer) == false)
      while (user_input.upcase != "Q") && (user_input.upcase != "P")
        puts "Invalid input.\nEnter p to play. Enter q to quit."
        user_input = gets.chomp 
      end

      if user_input.upcase == "Q" 
        return puts "Thank you for checking out CONNECT FOUR!"
      end

    else  user_input.upcase == "P"
     puts "Your chips will be X. Connect Four!"
    end
    @board.invert_board
    @board.print_board
    play
  end
end
