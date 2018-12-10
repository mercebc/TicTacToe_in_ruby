require 'core/players/human'
require 'core/players/easyComputer'

class PlayerFactory
  PLAYERS = {
    :human => Human,
    :easy_computer => EasyComputer
  }
  private_constant :PLAYERS

  def build(type, symbol, ui=nil)
    case type
    when :human
      PLAYERS[type].new(symbol, ui)
    when :easy_computer
      PLAYERS[type].new(symbol)
    end
  end
end 
