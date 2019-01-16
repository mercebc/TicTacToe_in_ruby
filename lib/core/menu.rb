require 'UI/UI'
require 'core/players/player_factory'
require 'core/players/human'
require 'core/players/easy_computer'
require 'core/flow'

class Menu
  MODE = {
    :HUMAN_VS_HUMAN  => 'h',
    :HUMAN_VS_EASY_COMPUTER  => 'e',
    :HUMAN_VS_HARD_COMPUTER  => 'i'
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
      when MODE[:HUMAN_VS_HARD_COMPUTER]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:hard_computer,"O")
      end
    players
  end

  def play
    board_size = 3
    @flow = Flow.new(@ui, @players, board_size)
    @flow.start
  end

end
