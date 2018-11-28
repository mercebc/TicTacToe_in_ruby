require 'UI/UI'
require 'core/board'

class Player
  attr_accessor :symbol
  attr_reader :ui

  def initialize(symbol, ui)
    @symbol = symbol
    @ui = ui
  end

  def move board
    position = @ui.get_position
    board.mark(position, @symbol)
  end
end
