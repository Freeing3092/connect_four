class Board
  attr_reader :game_board,
              :horizontal_board,
              :diagonal_board
  def initialize()
    @game_board = { 
    :A => [],
    :B => [],
    :C => [],
    :D => [],
    :E => [],
    :F => [],
    :G => []
  }
    @horizontal_board = {}
    @diagonal_board = []
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
  
  def invert_board_diagonal(grid)
    (0..grid.size-4).map do |i| 
      (0..grid.size-1-i).map { |j| grid[i+j][j]}
    end.concat((1..grid.size-3).map do |j| 
      (0..grid.size-j).map { |i| grid[i][j+i]}
    end)
  end
  
  def import_diagonal_board
    @diagonal_board = []
    @diagonal_board << invert_board_diagonal(@horizontal_board.values)
    @diagonal_board << invert_board_diagonal(@horizontal_board.values.reverse)
    @diagonal_board.flatten!(1)
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
end