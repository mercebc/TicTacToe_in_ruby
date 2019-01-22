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

  def build(mode, starting_player_symbol = "X")
    new_player = PlayerFactory.new
    players = Array.new
    case mode
      when MODE[:HUMAN_VS_HUMAN]
        players << new_player.build(:human,"X",@ui)
        players << new_player.build(:human,"O",@ui)
      when MODE[:HUMAN_VS_EASY_COMPUTER]
        players << new_player.build(:human,"X",@ui)
        players << new_player.build(:easy_computer,"O")
      when MODE[:HUMAN_VS_HARD_COMPUTER]
        players << new_player.build(:human,"X",@ui)
        players << new_player.build(:hard_computer,"O")
      end
    order_players(players, starting_player_symbol)
  end

private

  def order_players(players, starting_player_symbol)
    if players.first.symbol == starting_player_symbol
      players
    else
      swap_players(players)
    end
  end

  def swap_players(players)
    players[0], players[1] = players.last, players.first
    players
  end

end
