require 'UI/UI'
require 'core/board'
require 'core/player'

class Flow
  attr_reader :ui, :board

  def initialize (ui, board)
    @ui = ui
    @board = board
    @players = [Player.new("X", @ui), Player.new("O", @ui)]
  end

  def start
    @ui.show_grid(@board)
    until game_over do
      play
    end
    @ui.announce_results(@board, @players)
  end

  def play
    position = current_player.get_valid_position(@board)
    @board.mark(position, current_player.symbol)
    @ui.show_grid(@board)
    swap_players
  end

  def game_over
    @board.tie? or @board.win?(@players)
  end

  def swap_players
    @players[0], @players[1] = opponent, current_player
  end

  def current_player
    @players.first
  end

  def opponent
    @players.last
  end

end
