require 'rspec'
require 'core/setup'
require 'core/players/human'
require 'core/flow'

describe Setup do

  let(:output) { StringIO.new }

  it 'creates players' do
    ui = UI.new
    setup = Setup.new(ui)
    players = setup.create_players("h")

    expect(players.first).to be_a(Human)
    expect(players.last).to be_a(Human)
    expect(players.length).to eq(2)
  end

  it 'creates a board' do
    ui = UI.new
    setup = Setup.new(ui)
    board = setup.create_board

    expect(board).to be_a(Board)
  end

  it 'creates a flow' do
    ui = UI.new
    setup = Setup.new(ui)
    flow = setup.create_flow("h")

    expect(flow).to be_a(Flow)
  end

  it 'builds the setup' do
    user_input = StringIO.new("e")
    ui = UI.new(output, user_input)
    setup = Setup.new(ui)
    result = setup.build
    expect(result.first).to eq("e")
    expect(result.last).to be_a(Flow)
  end
end
