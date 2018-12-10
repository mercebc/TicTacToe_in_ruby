require 'UI/UI'
require 'core/board'
require 'core/players/human'
require 'core/players/easy_computer'
require 'core/players/player_factory'

class Flow
  attr_reader :ui, :board, :players

  def initialize (ui, players, board_size)
    @ui = ui
    @board = Board.new(board_size)
    @players = players
  end

  def start
    @ui.show_grid(@board)
    until game_over do
      play_turn
    end
    @ui.announce_results(@board, @players)
  end

  def play_turn
    position = current_player.get_position(@board)
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
