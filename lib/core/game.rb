require 'core/setup'
require 'UI/UI'

class Game
  attr_reader :ui, :setup

  def initialize
    @ui = UI.new
    setup = Setup.new(@ui)
    setup.play
    rescue Interrupt => e
      puts "Thanks for playing! see you next time!"
  end
end
