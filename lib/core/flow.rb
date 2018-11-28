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
    @players[0].move @board
    swap_players
    @ui.show_grid(@board)
  end

  def swap_players
    @players[0], @players[1] = @players[1], @players[0]
  end
end
