require 'core/menu'

class Game
  attr_reader :ui, :menu, :name

  def initialize
    @ui = UI.new
    @connection = PG.connect(dbname: 'tictactoe', user: 'ttt', password:'tictactoe')
    @menu = Menu.new(@ui, @connection)
    init
  rescue Interrupt => e
    if @menu.flow
      name = @ui.get_new_name(@connection)
      @menu.save(name)
    end
    @ui.print_message("Thanks for playing! see you next time!")
  end

  def init
    @ui.clear_screen
    @ui.welcome
    if @menu.games_available
      name = @ui.get_game_name(@connection)
      @menu.setup_saved_game(name)
    else
      @menu.setup
    end
  end

end
