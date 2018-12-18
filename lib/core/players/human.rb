require 'UI/UI'
require 'core/board'

class Human
  attr_reader :symbol

  def initialize(symbol, ui)
    @symbol = symbol
    @ui = ui
  end

  def get_position(board)
    @ui.get_position(board)
  end

end
