require 'UI/gameUI'
require 'core/board'

class Flow
  attr_reader :gameUI
  attr_reader :board

  def initialize (gameUI, board)
    @gameUI = gameUI
    @board = board
  end

  def start
    @gameUI.show_grid(@board)
    while !@board.is_full?
      play
    end
  end

  def play
    position = 0
    loop do
      position = @gameUI.get_position
      position  = position - 1
      break if @board.grid[position].is_empty? == true
    end
    @board.mark(position, @gameUI.get_symbol)
    @gameUI.show_grid(@board)
  end

end
