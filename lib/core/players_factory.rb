require 'core/players/player_factory'

class PlayersFactory
  MODE = {
    :HUMAN_VS_HUMAN  => 'h',
    :HUMAN_VS_EASY_COMPUTER  => 'e',
    :HUMAN_VS_HARD_COMPUTER  => 'i'
  }

  def initialize(ui)
    @ui = ui
  end

  def build(mode)
    new_player = PlayerFactory.new
    players = Array.new
    case mode
      when MODE[:HUMAN_VS_HUMAN]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:human,"O",@ui)
      when MODE[:HUMAN_VS_EASY_COMPUTER]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:easy_computer,"O")
      when MODE[:HUMAN_VS_HARD_COMPUTER]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:hard_computer,"O")
      end
    players
  end
end
