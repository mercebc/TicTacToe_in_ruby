require 'core/players/human'
require 'core/players/easy_computer'
require 'core/players/hard_computer'

class PlayerFactory
  PLAYERS = {
    :human => Human,
    :easy_computer => EasyComputer,
    :hard_computer => HardComputer
  }

  def build(type, symbol, ui=nil)
    case type
    when :human
      PLAYERS[type].new(symbol, ui)
    when :easy_computer, :hard_computer
      PLAYERS[type].new(symbol)
    end
  end
end 
