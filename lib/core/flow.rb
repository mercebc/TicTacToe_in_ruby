require 'UI/UI'
require 'core/board'
require 'core/player'

class Flow
  attr_reader :ui
  attr_reader :board

  def initialize (ui, board)
    @ui = ui
    @board = board
    @players = [Player.new("X", @ui), Player.new("O", @ui)]
  end

  def start
    @ui.show_grid(@board)
    while !@board.is_full?
      play
    end
  end

  def play
    position = current_player.get_valid_position(@board)
    @board.mark(position, current_player.symbol)
    @ui.show_grid(@board)
    swap_players
  end

  def swap_players
    @players[0], @players[1] = @players[1], @players[0]
  end

  def current_player
    @players.first
  end

end
