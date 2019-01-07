require 'UI/UI'
require 'core/board'

class Human
  attr_reader :symbol

  def initialize(symbol, ui)
    @symbol = symbol
    @ui = ui
  end

  def get_position(flow)
    @ui.get_position(flow.board)
  end

end
