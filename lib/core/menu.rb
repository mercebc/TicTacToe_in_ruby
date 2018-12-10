require 'UI/UI'
require 'core/players/player_factory'
require 'core/players/human'
require 'core/players/easy_computer'
require 'core/flow'

class Menu
  attr_reader :ui, :mode, :players, :flow

  def initialize
    @ui = UI.new
  end

  def setup
    mode = @ui.get_game_mode
    @players = create_players(mode)
    play
  end

  def create_players(mode)
    new_player = Player_factory.new
    players = Array.new
    case mode
      when 'h'
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:human,"O",@ui)
      when 'e'
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
