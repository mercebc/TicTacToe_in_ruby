require 'UI/UI'
require 'core/board'
require 'core/players/human'

class Flow
  attr_reader :ui, :board, :players

  def initialize (ui, players, board)
    @ui = ui
    @board = board
    @players = players
  end

  def start
    @ui.display_grid(@board)
    until game_over do
      if current_player.is_a?(Human) then @ui.display_insert_position(current_player) end
      play_turn
      @ui.clear_screen
      @ui.display_turn(current_player, @board)
      swap_players
    end
    game_results
  end

  def play_turn
    position = current_player.get_position(self)
    @board.mark(position, current_player.symbol)
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

  def game_over
    @board.tie? or @board.win?(@players)
  end

  def winner
    @players.select { |player| @board.winner?(player) }.first
  end

  def game_results
    if @board.win?(@players)
      @ui.announce_winner(winner)
    else
      @ui.announce_tie
    end
  end

end
