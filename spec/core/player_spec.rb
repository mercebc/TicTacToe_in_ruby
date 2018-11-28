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

  it 'cant play in a cell that is already marked' do
    player1_input = StringIO.new("4")
    player1_ui = UI.new(StringIO.new, player1_input)
    player1 = Player.new("X", player1_ui)
    player1.move(@board)
    player2_input = StringIO.new("4\n3")
    player2_ui = UI.new(@output, player2_input)
    player2 = Player.new("X", player2_ui)
    player2.move(@board)
    expect(@output.string).to include("Please choose a different position where the cell is empty\n")
  end
end
