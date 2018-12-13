require 'UI/UI'
require 'core/board'

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
      @ui.clear_screen
      display_turn
      swap_players
    end
    @ui.announce_results(@board, @players)
  end

  def play_turn
    @ui.print_message("Player " + current_player.symbol + ", please insert a position: ")
    position = current_player.get_position(@board)
    @board.mark(position, current_player.symbol)
  end

  def display_turn
    @ui.print_message("Player " + current_player.symbol + "'s turn:\n")
    @ui.show_grid(@board)
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
