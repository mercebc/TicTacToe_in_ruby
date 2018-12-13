require 'UI/UI'
require 'core/players/player_factory'
require 'core/players/human'
require 'core/players/easy_computer'
require 'core/flow'

class Menu
  MODE = {
    :HUMAN_VS_HUMAN  => 'h',
    :HUMAN_VS_EASY_COMPUTER  => 'e'
  }

  def initialize(ui)
    @ui = ui
  end

  def setup
    mode = @ui.get_mode
    @players = create_players(mode)
    play
  end

  def create_players(mode)
    new_player = PlayerFactory.new
    players = Array.new
    case mode
      when MODE[:HUMAN_VS_HUMAN]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:human,"O",@ui)
      when MODE[:HUMAN_VS_EASY_COMPUTER]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:easy_computer,"O")
      end
    players
  end

  def play
    @flow = Flow.new(@ui, @players, 3)
    @flow.start
  end

end
