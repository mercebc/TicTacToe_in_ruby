require 'UI/UI'
require 'core/players/player_factory'
require 'core/players/human'
require 'core/players/easy_computer'
require 'core/flow'
require 'database/game_dao'
require 'database/cell_dao'

class Menu
  attr_accessor :mode, :board_size, :flow

  MODE = {
    :HUMAN_VS_HUMAN  => 'h',
    :HUMAN_VS_EASY_COMPUTER  => 'e',
    :HUMAN_VS_HARD_COMPUTER  => 'i'
  }

  def initialize(ui, connection)
    @ui = ui
    @connection = connection
  end

  def setup
    @mode = @ui.get_mode
    @board_size = 3
    play
  end

  def setup_saved_game(name)
    @saved_game = GameDAO.find(name, @connection)
    @mode = @saved_game.mode
    @board_size = @saved_game.board_size
    @saved_cells = CellDAO.all(@saved_game.id, @connection)
    GameDAO.delete(name, @connection)
    play
  end

  def save_game(name)
    saving_game = GameDAO.new(nil, name, @flow.board.size, @mode, @flow.current_player.symbol)
    saving_game.insert(@connection)
    saving_game
  end

  def save_cells(game_id)
    board = @flow.board
    last_position = board.capacity - 1

    for position in 0..last_position do
      content = board.get_content(position)
      if content
        cell = CellDAO.new(nil, position, content)
        cell.insert(game_id, @connection)
      end
    end
  end

  def save(name)
    saving_game = save_game(name)
    save_cells(saving_game.id)
  end

  def games_available
    games_available = GameDAO.all(@connection)
    if (games_available)
      if (@ui.play_saved_game)
        @ui.show_saved_games(games_available)
      end
    end
  end

  def create_players(mode)
    new_player = PlayerFactory.new
    players = Array.new
    case mode
      when MODE[:HUMAN_VS_HUMAN]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:human,"O",@ui)
      when MODE[:HUMAN_VS_EASY_COMPUTER]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:easy_computer,"O")
      when MODE[:HUMAN_VS_HARD_COMPUTER]
        players[0] = new_player.build(:human,"X",@ui)
        players[1] = new_player.build(:hard_computer,"O")
      end
    players
  end

  def create_flow
    players = create_players(@mode)
    @flow = Flow.new(@ui, players, @board_size)
  end

  def play
    create_flow
    if @saved_game
      @flow.order_players(@saved_game)
      @flow.load_board(@saved_cells)
    end
    @flow.start
  end


end
