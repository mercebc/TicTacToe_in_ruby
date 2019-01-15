require 'rspec'
require 'core/Menu'
require 'UI/UI'
require 'database/cell_dao'

describe Menu do

  let(:ui) { UI.new }
  let(:connection) { PG.connect(dbname: 'tictactoe', user: 'ttt', password:'tictactoe') }
  let(:menu) { Menu.new(ui, connection) }

  def mark_board(marks)
    marks.each_with_index do |symbol, position|
      menu.flow.board.mark(position, symbol)
    end
  end

  it 'creates human-human players' do
    mode = 'h'
    players = menu.create_players(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(Human)
  end

  it 'creates human-easy_computer players' do
    mode = 'e'
    players = menu.create_players(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(EasyComputer)
  end

  it 'creates human-hard_computer players' do
    mode = 'i'
    players = menu.create_players(mode)
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(HardComputer)
  end

  it 'creates a flow' do
    menu.mode = 'e'
    menu.board_size = 3
    menu.create_flow
    expect(menu.flow).to_not be(nil)
  end

  it 'displays all games available' do
  end

end
