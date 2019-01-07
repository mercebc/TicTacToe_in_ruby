require 'rspec'
require 'core/Menu'
require 'UI/UI'

describe Menu do

  let(:ui) { UI.new }
  let(:menu) { Menu.new(ui) }

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

end
