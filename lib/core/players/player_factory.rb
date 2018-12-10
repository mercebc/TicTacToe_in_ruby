require 'core/players/human'
require 'core/players/easy_computer'

class Player_factory
  PLAYERS = {
    'human' => Human,
    'easy_computer' => Easy_computer
  }
  private_constant :PLAYERS

  def build(type, symbol, ui=nil)
    case type
    when :human
      PLAYERS[type.to_s].new(symbol, ui)
    when :easy_computer
      PLAYERS[type.to_s].new(symbol)
    end
  end
end 
