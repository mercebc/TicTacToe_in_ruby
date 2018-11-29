require 'rspec'
require 'UI/UI'
require 'core/player'
require 'core/board'

describe Player do

    let(:board) { Board.new(3) }
    let(:output) { StringIO.new }

  it 'plays her/his turn' do
    user_input = StringIO.new("4")
    user_ui = UI.new(output, user_input)
    player = Player.new("X", user_ui)
    expect(player.get_valid_position(board)).to eq(3)
  end

  it 'cant play in a cell that is already marked' do
    board.mark(2, "O")
    player_input = StringIO.new("3\n4")
    player_ui = UI.new(output, player_input)
    player = Player.new("X", player_ui)
    player.get_valid_position(board)
    expect(output.string).to include("Please choose a different position where the cell is empty\n")
  end
end
