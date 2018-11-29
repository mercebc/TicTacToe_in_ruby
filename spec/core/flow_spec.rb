require 'rspec'
require 'core/flow'
require 'core/board'
require 'UI/UI'

describe Flow do

    let(:board) { Board.new(3) }
    let(:output) { StringIO.new }

  it 'can not place a symbol if the cell is not empty' do
    user_input = StringIO.new("1\n1\n2\n3\n4\n5\n6\n7\n8\n9")
    ui = UI.new(output, user_input)
    flow = Flow.new(ui, board)
    flow.start
    expect(output.string).to include("Please choose a different position where the cell is empty\n")
  end

  it 'current player is the first player in the array' do
    ui = UI.new
    flow = Flow.new(ui, board)
    expect(flow.current_player.symbol).to eq("X")
  end

  it 'opponent is the last player in the array' do
    ui = UI.new
    flow = Flow.new(ui, board)
    expect(flow.opponent.symbol).to eq("O")
  end

  it 'swap players in the array' do
    ui = UI.new
    flow = Flow.new(ui, board)
    flow.swap_players
    expect(flow.current_player.symbol).to eq("O")
    expect(flow.opponent.symbol).to eq("X")
  end

end
