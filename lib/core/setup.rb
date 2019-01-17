require 'UI/UI'
require 'core/players/player_factory'
require 'core/players/human'
require 'core/players/easy_computer'
require 'core/flow'

class Setup
  def initialize(ui)
    @ui = ui
  end

  def create_players
    mode = @ui.get_mode
    playersFactory = PlayersFactory.new(@ui)
    playersFactory.build(mode)
  end

  def create_board
    board_size = 3
    Board.new(board_size)
  end

  def play
    board = create_board
    players = create_players
    @flow = Flow.new(@ui, players, board)
    @flow.start
  end

end
