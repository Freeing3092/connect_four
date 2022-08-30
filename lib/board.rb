class Board
  attr_reader :game_board, #may need to allow other classes to change later
              :horizontal_board
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
end