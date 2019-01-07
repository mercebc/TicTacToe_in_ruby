require 'rspec'
require 'UI/UI'
require 'core/players/human'
require 'core/board'

describe Human do

    let(:output) { StringIO.new }
    let(:ui) { UI.new }

  it 'plays her/his turn' do
    user_input = StringIO.new("4")
    user_ui = UI.new(output, user_input)
    human_player = Human.new("X", user_ui)
    players = [human_player, EasyComputer.new("O")]

    flow = Flow.new(ui, players, 3)
    expect(human_player.get_position(flow)).to eq(3)
  end

end
