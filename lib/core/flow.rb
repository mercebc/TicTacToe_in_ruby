require 'UI/UI'
require 'core/board'

class Flow
  attr_reader :ui
  attr_reader :board

  def initialize (ui, board)
    @ui = ui
    @board = board
  end

  def start
    @ui.show_grid(@board)
    while !@board.is_full?
      play
    end
  end

  def get_valid_position
    position = @ui.get_position
    until @board.grid[position].is_empty? do
    @ui.show_error_message("Please choose a different position where the cell is empty\n")
    position = @ui.get_position
    end
    position
  end

  def play
    @board.mark(get_valid_position, @ui.get_symbol)
    @ui.show_grid(@board)
  end
end
