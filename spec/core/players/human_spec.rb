require 'rspec'
require 'UI/UI'
require 'core/players/human'
require 'core/board'

describe Human do

    let(:board) { Board.new(3) }
    let(:output) { StringIO.new }

  it 'plays her/his turn' do
    user_input = StringIO.new("4")
    user_ui = UI.new(output, user_input)
    player = Human.new("X", user_ui)
    expect(player.get_position(board)).to eq(3)
  end

end
