class Board
  attr_reader :game_board,
              :horizontal_board,
              :diagonal_board
  def initialize()
    @game_board = { 
    "A" => [],
    "B" => [],
    "C" => [],
    "D" => [],
    "E" => [],
    "F" => [],
    "G" => []
  }
    @horizontal_board = {}
    @diagonal_board = {}
  end

  def invert_board
    column_index = 5
    6.times do
      row = []
      game_board.values.each do |column|
        row << column[column_index]
      end
      @horizontal_board[column_index] = row
      column_index -= 1
    end
  end
  
  def invert_board_diagonal
    n = 0
    i = 0
    7.times do
      diagonal = []
      @horizontal_board.values.reverse.each do |row|
        diagonal << row[i]
        i += 1
      end
      @diagonal_board[n] = diagonal
      n += 1
      i = n
    end
    
    k = 0
    i = 0
    7.times do
      diagonal = []
      @horizontal_board.values.each do |row|
        diagonal << row[i]
        i += 1
      end
      @diagonal_board[n] = diagonal
      n += 1
      k += 1
      i = k
    end
    
    k = 4
    i = 4
    5.times do
      diagonal = []
      @horizontal_board.values.reverse.each do |row|
        diagonal << row[i]
        i -= 1
      end
      @diagonal_board[n] = diagonal
      n += 1
      k -= 1
      i = k
    end
    
    k = 4
    i = 4
    5.times do
      diagonal = []
      @horizontal_board.values.each do |row|
        diagonal << row[i]
        i -= 1
      end
      @diagonal_board[n] = diagonal
      n += 1
      k -= 1
      i = k
    end
  end
  
  def print_board
    puts game_board.keys.join(' ')
    @horizontal_board.values.each do |row|
      subbed_row = []
      row.each do |slot|
        if slot == nil
          subbed_row << '.'
        else
          subbed_row << slot
        end
      end
      puts subbed_row.join(' ')
    end
  end

  def welcome_message
    puts "Welcome to CONNECT FOUR!\n"
  end
end