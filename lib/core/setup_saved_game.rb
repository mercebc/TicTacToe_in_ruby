require 'core/players_factory'
require 'database/game_repository'

class SetupSavedGame

  def initialize(ui, connection)
    @ui = ui
    @game_repo = GameRepository.new(connection)
  end

  def load(name)
    setup = Array.new
    saved_game = load_saved_game(name)
    mode = saved_game['mode']
    setup << mode
    setup << create_flow(saved_game)
    setup
  end

  def load_saved_game(name)
    @game_repo.readGameByName(name)
  end

  def create_flow(saved_game)
    board = load_board(saved_game)
    players = create_players(saved_game)
    Flow.new(@ui, players, board)
  end

  def create_players(saved_game)
    mode = saved_game['mode']
    current_player_symbol = @game_repo.current_player_symbol(saved_game['board'])
    playersFactory = PlayersFactory.new(@ui)
    playersFactory.build(mode, current_player_symbol)
  end

  def load_board(saved_game)
    board = @game_repo.parse_board(saved_game['board'])
  end



end
