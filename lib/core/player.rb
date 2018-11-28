require 'UI/UI'
require 'core/board'

class Player
  attr_accessor :symbol
  attr_reader :ui

  def initialize(symbol, ui)
    @symbol = symbol
    @ui = ui
  end

  def move (board)
    position = get_valid_position board
    board.mark(position, @symbol)
  end

  def get_valid_position (board)
    position = @ui.get_position
    until board.grid[position].is_empty? do
      @ui.show_error_message("Please choose a different position where the cell is empty\n")
      position = @ui.get_position
    end
    position
  end

end
