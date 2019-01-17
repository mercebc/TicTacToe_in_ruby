require 'core/setup'

class Game
  attr_reader :ui, :menu

  def initialize
    @ui = UI.new
    @setup = Setup.new(@ui)
    @setup.setup
    rescue Interrupt => e
      puts "Thanks for playing! see you next time!"
  end
end
