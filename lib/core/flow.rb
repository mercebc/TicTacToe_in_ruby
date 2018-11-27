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

  def play
    position = 0
    begin
      position = @ui.get_position
      raise ArgumentError.new("Please choose a different position where the cell is empty") if @board.grid[position].is_empty? == false
    rescue ArgumentError => e
      @ui.show_error_message(e.message)
      position = @ui.get_position
    end
    @board.mark(position, @ui.get_symbol)
    @ui.show_grid(@board)
  end
end
