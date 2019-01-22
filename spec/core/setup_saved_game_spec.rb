require 'rspec'
require 'core/players/human'
require 'core/setup_saved_game'
require 'core/flow'
require 'pg'
require 'database/game_repository'


describe SetupSavedGame do

  let(:ui) { UI.new }
  let (:test_connection) { PG.connect(dbname: 'tictactoe_test', user: 'ttt', password: 'tictactoe') }
  let(:setup) { SetupSavedGame.new(ui, test_connection) }
  let(:saved_game) { {"board"=>"XX__O__X_", "id"=>"65", "mode"=>"h", "name"=>"mercevshimalee"} }

  it 'creates the players' do
    players = setup.create_players(saved_game)
    expect(players.first).to be_a(Human)
    expect(players.last).to be_a(Human)
  end

  it 'loads a gameRepo' do
    name = 'mercevshimalee'
    saved_game = setup.load_saved_game(name)
    expect(saved_game['name']).to eq("mercevshimalee")
  end

  it 'loads the board' do
    board = setup.load_board(saved_game)
    expect(board.get_content(0)).to eq("X")
    expect(board.get_content(4)).to eq("O")
  end

  it 'creates the flow' do
    flow = setup.create_flow(saved_game)
    expect(flow).to be_a(Flow)
  end

  it 'loads the game' do
    result = setup.load("mercevshimalee")
    expect(result.first).to eq("e")
    expect(result.last).to be_a(Flow)
  end

end


