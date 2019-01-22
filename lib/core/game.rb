require 'core/setup'
require 'UI/UI'
require 'core/flow'
require 'core/setup_saved_game'
require 'core/setup'
require 'pg'

class Game
  attr_reader :ui, :flow

  def initialize
    @ui = UI.new
    @connection = PG.connect(dbname: 'tictactoe', user: 'ttt', password: 'tictactoe')
  end

  def setup
    setup_saved_game = SetupSavedGame.new(@ui, @connection)
    setup_new_game = Setup.new(@ui)
    if @ui.load_game?
    #  @ui.display_saved_games(all_names)
      setup = setup_saved_game.load(@ui.get_name)
    else
      setup = setup_new_game.build()
    end
    @mode = setup.first
    @flow = setup.last
  end

  def start
    begin
    setup
    @flow.start
    rescue Interrupt => e
      @ui.display_message "Thanks for playing! see you next time!"
    end
  end

end
