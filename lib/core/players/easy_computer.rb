require 'core/board'

class EasyComputer
  attr_accessor :symbol

  def initialize(symbol)
    @symbol = symbol
  end

  def get_position(flow)
    flow.board.available_positions.sample
  end

end
