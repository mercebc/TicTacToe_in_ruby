require 'UI/UI'
require 'core/players_factory'
require 'core/board'

class Setup
  def initialize(ui)
    @ui = ui
  end

  def build
    setup = Array.new
    mode = @ui.get_mode
    setup << mode
    setup << create_flow(mode)
    setup
  end

  def create_flow(mode)
    board = create_board
    players = create_players(mode)
    Flow.new(@ui, players, board)
  end

  def create_players(mode)
    playersFactory = PlayersFactory.new(@ui)
    playersFactory.build(mode)
  end

  def create_board
    board_size = 3
    Board.new(board_size)
  end

end
