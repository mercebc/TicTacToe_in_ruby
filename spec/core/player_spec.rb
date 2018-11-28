require 'rspec'
require 'UI/UI'
require 'core/player'
require 'core/board'

describe Player do

  before(:each) do
    @board = Board.new(3)
    @output = StringIO.new
  end

  it 'plays her/his turn' do
    user_input = StringIO.new("4")
    user_ui = UI.new(StringIO.new, user_input)
    player = Player.new("X", user_ui)
    player.move(@board)
    ui = UI.new(@output, StringIO.new)
    ui.show_grid(@board)
    expect(@output.string).to eq("   |   |   \n---+---+---\n X |   |   \n---+---+---\n   |   |   \n")
  end
end
