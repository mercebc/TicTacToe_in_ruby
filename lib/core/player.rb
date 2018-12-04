require 'UI/UI'
require 'core/board'

class Player
  attr_reader :symbol
  attr_reader :ui

  def initialize(symbol, ui)
    @symbol = symbol
    @ui = ui
  end

  def get_valid_position(board)
    validate_position(@ui.get_position, board)
  end

  def validate_position(position, board)
    board.invalid_cell(position) ? get_validated_position(board) : position
  end

  def get_validated_position(board)
    @ui.show_error_message("Please choose a different position where the cell is empty\n")
    get_valid_position(board)
  end

  private :validate_position, :get_validated_position
end
